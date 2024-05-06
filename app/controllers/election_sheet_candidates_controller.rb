class ElectionSheetCandidatesController < ApplicationController
  def new
    authorize ElectionSheetCandidate
    election_sheet = ElectionSheet.find_by(id: params[:election_sheet_id]) || ElectionSheet.new(id: params[:election_sheet_id])
    render turbo_stream: turbo_stream.append("election_sheet#{election_sheet.id}_candidates", partial: 'election_sheet_candidates/election_sheet_candidate',
                                             locals: { election_sheet_candidate: ElectionSheetCandidate.new(election_sheet: election_sheet), election_sheet: election_sheet })
  end
end