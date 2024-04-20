class ElectionsController < ApplicationController
  def index
    @elections = Election.all

    authorize @elections
  end

  def new
    @election = Election.new
    @election.election_groups.build

    authorize @election
  end

  def create
    @election = Election.new(election_params)

    authorize @election

    respond_to do |format|
      if create_election
        format.html { redirect_to elections_path, notice: 'Pomyślnie utworzono wybory.' }
        format.json { render :index, status: :created, location: @election }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def election_params
    params.require(:election).permit(
      :name,
      :description,
      :date_from,
      :date_to,
      election_groups_attributes: [:group_id]
    )
  end

  def parsed_group_ids
    unparsed_group_ids = params[:election][:election_groups][:group_id]
    unparsed_group_ids.select { |group| group unless group.blank? || group == '' }
    unparsed_group_ids
  end

  def create_election
    success = false
    ActiveRecord::Base.transaction do
      success = @election.save

      parsed_group_ids.each do |group_id|
        success = @election.election_groups.build(group_id:).save
      end

      raise ActiveRecord::Rollback unless success
    end

    success
  rescue ActiveRecord::Rollback
    success
  end
end
