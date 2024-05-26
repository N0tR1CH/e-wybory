class ElectionSheetUserVotesController < ApplicationController
  include ActionView::RecordIdentifier
  include ActiveRecord::CounterCache
  before_action :set_election_sheet

  def create
    authorize ElectionSheetUserVote
    validation_error = 0
    voted = false
    
    votes = params[:votes].map(&:to_i)
    raise ArgumentError if votes.any?(&:negative?)

    candidate_ids = params[:election_candidate_id]

    validation_error = 1 if votes.sum > @election_sheet.max_votes_per_user
    validation_error = 2 if votes.any? { |vote| vote > @election_sheet.max_votes_per_candidate }
    validation_error = 3 if @election_sheet.requires_all_votes_spent && votes.sum != @election_sheet.max_votes_per_user
    
    if validation_error.zero?
      @election_sheet_user_vote = ElectionSheetUserVote.new(
        election_sheet_id: @election_sheet.id,
        user_id: current_user.id
      )

      if @election_sheet_user_vote.save
        candidate_ids.zip(votes).each do |candidates_id, votes_count|
          ElectionSheetCandidate.increment_counter(:votes, candidates_id, by: votes_count)
        end
        voted = true

        #debugging
        puts(params.to_json)
      end
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          dom_id(@election_sheet),
          partial: 'elections/vote_sheet',
          locals: {
            election_sheet: @election_sheet,
            index: @election_sheet.id,
            sheet_has_been_voted: voted,
            validation_error:
          }
        )
      end
    end
  end

  private

  def set_election_sheet
    @election_sheet = ElectionSheet.find(params[:id])
    @user = current_user
  end

  def election_sheet_user_vote_params
    params.require(:election_sheet_user_vote).permit(:id, :user_id, election_sheet_candidate_ids: [], votes: [])
  end
end
