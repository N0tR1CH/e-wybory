class ElectionSheetUserVotesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_election_sheet

  def create
    authorize ElectionSheetUserVote
    @election_sheet_user_vote = ElectionSheetUserVote.new(
      election_sheet_id: @election_sheet.id,
      user_id: current_user.id
    )

    if @election_sheet_user_vote.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            dom_id(@election_sheet),
            partial: 'elections/vote_sheet',
            locals: {
              election_sheet: @election_sheet,
              index: @election_sheet.id,
              sheet_has_been_voted: true
            }
          )
        end
      end
    else
      # TODO: Render election_sheet with errors
    end
  end

  private

  def set_election_sheet
    @election_sheet = ElectionSheet.find(params[:id])
    @user = current_user
  end

  def election_sheet_user_vote_params
    params.require(:election_sheet_user_vote).permit(:id, :user_id, election_sheet_candidate_ids: [])
  end
end
