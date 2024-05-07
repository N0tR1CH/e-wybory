class ElectionSheetCandidatesController < ApplicationController
  def new
    authorize ElectionSheetCandidate
    election_sheet = ElectionSheet.find_by(id: params[:election_sheet_id]) || ElectionSheet.new(id: params[:election_sheet_id])
    render turbo_stream: turbo_stream.append("election_sheet#{election_sheet.id}_candidates", partial: 'election_sheet_candidates/election_sheet_candidate',
                                             locals: { election_sheet_candidate: ElectionSheetCandidate.new(election_sheet: election_sheet), election_sheet: election_sheet })
  end

  def destroy
    election_sheet_candidate = ElectionSheetCandidate.find(params[:id])
    authorize election_sheet_candidate
    election_sheet_candidate.destroy
  rescue ActiveRecord::RecordNotFound
    election_sheet_candidate = ElectionSheetCandidate.new(id: params[:id])
    authorize ElectionSheetCandidate
  ensure
    render turbo_stream: turbo_stream.remove("election_sheet_candidate_#{election_sheet_candidate.id}")
  end
end
