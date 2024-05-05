class ElectionsController < ApplicationController
  def index
    @elections = Election.all

    authorize @elections
  end

  def new
    @election = Election.new

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
    return unless params[:election].present?

    params[:election][:election_groups] ||= []

    @election = Election.find(params[:id])
    authorize @election

    respond_to do |format|
      format.html { render json: params }
    end

    # existing_sheets = @election.elections_sheets.where(id: params[:election][])
    #
    # raise ActionController::BadRequest unless @election.update(election_params)
    #
    # respond_to do |format|
    #  if create_election
    #    format.html { redirect_to elections_path, notice: 'Pomyślnie zaktualizowano wybory' }
    #    format.json { render :index, status: :created, location: @election }
    #  else
    #    format.html { render :new, status: :unprocessable_entity }
    #    format.json { render json: @election.errors, status: :unprocessable_entity }
    #  end
    # end
  end

  def destroy
    @election = Election.find(params[:id])

    authorize @election

    ActiveRecord::Base.transaction do
      success = @election.destroy

      raise ActiveRecord::Rollback unless success
    end

    respond_to do |format|
      format.html { redirect_to elections_path, notice: "Pomyślnie usunięto wybory o id: #{params[:id]}" }
      format.json { render :index, status: :created, location: @election }
    end
  rescue ActiveRecord::Rollback
    respond_to do |format|
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @election.errors, status: :unprocessable_entity }
    end
  end

  private

  def election_params
    params.require(:election).permit(
      :name,
      :description,
      :date_from,
      :date_to,
      group_ids: []
    )
  end
end
