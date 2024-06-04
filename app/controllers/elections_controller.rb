class ElectionsController < ApplicationController
  before_action :set_election, only: %i[edit update destroy vote results]

  def index
    @elections ||= Election.all

    authorize @elections
  end


  def recent
    dt_now = DateTime.now

    @elections = Election.where(date_to: ..dt_now)
    @highlighted_item = 1

    authorize @elections

    render :index
  end

  def current
    dt_now = DateTime.now

    @elections = Election.where(date_from: ..dt_now, date_to: dt_now..)
    @highlighted_item = 2
    
    authorize @elections

    render :index
  end
  def upcoming
    dt_now = DateTime.now

    @elections = Election.where(date_from: dt_now..)
    @highlighted_item = 3

    authorize @elections

    render :index
  end

  def new
    @election = Election.new
    @election.election_sheets.build.election_sheet_candidates.build

    authorize @election
  end

  def create
    @election = Election.new(election_params)

    authorize @election

    respond_to do |format|
      if @election.save
        format.html { redirect_to elections_path, notice: 'Pomyślnie utworzono wybory.' }
        format.json { render :index, status: :created, location: @election }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @election = Election.find(params[:id])

    authorize @election
  end

  def update
    @election = Election.find(params[:id])

    authorize @election

    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to elections_path, notice: 'Pomyślnie zaktualizowano wybory.' }
        format.json { render :index, status: :created, location: @election }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @election = Election.find(params[:id])

    authorize @election
    if @election.destroy
      redirect_to elections_path, notice: 'Pomyślnie usunięto wybory.'
    else
      redirect_to elections_path, alert: 'Nie udało się usunąć wyborów.'
    end
  end

  def vote
    authorize @election
  end

  def results
    authorize @election

  end

  def pdf_preview
    @election = Election.eager_load(:election_sheets, :election_sheet_user_votes, :election_sheet_candidates).find(params[:id])

    authorize @election

    render 'elections/pdf', layout: false
  end

  def pdf
    @election = Election.eager_load(:election_sheets, :election_sheet_user_votes, :election_sheet_candidates).find(params[:id])

    authorize @election

    pdf_str = render_to_string pdf: "some_file_name", template: "elections/pdf", encoding: "UTF-8" , dpi: 300, zoom: 1.1285

    send_data pdf_str,
              filename: "document.pdf",
              type: "application/pdf",
              disposition: "inline",
              dpi: 300

    #redirect_to("data:application/pdf;base64,#{Base64.strict_encode64(pdf_str)}", allow_other_host: true )
  end


  private

  def set_election
    @election = Election.find(params[:id])
    @user = current_user
  end

  def election_params
    params.require(:election).permit(
      :name,
      :description,
      :date_from,
      :date_to,
      group_ids: [],
      election_sheets_attributes: [
        :id,
        :name,
        :description,
        :max_votes_per_user,
        :max_votes_per_candidate,
        :requires_all_votes_spent,
        { election_sheet_candidates_attributes: %i[id name] }
      ]
    )
  end
end
