class ElectionSheetUserVotesController < ApplicationController
  before_action :set_election_sheet

  def create
    @election_sheet_user_vote = ElectionSheetUserVote.new(
      election_sheet_id: @election_sheet.id,
      user_id: current_user.id
    )

    if @election_sheet_user_vote.save
      # TODO: Render election_sheet successfully voted
    else
      # TODO: Render election_sheet with errors
    end
  end

  private

  def set_election_sheet
    @election_sheet = ElectionSheet.find(params[:election_sheet_id])
  end

  def election_sheet_user_vote_params
    params.require(:election_sheet_user_vote).permit(:election_sheet_id, :user_id, election_sheet_candidate_ids: [])
  end
end
