class ElectionSheetsController < ApplicationController
  def new
    authorize ElectionSheet
    render turbo_stream: turbo_stream.append('election_sheets', partial: 'election_sheets/election_sheet',
                                             locals: { election_sheet: ElectionSheet.new })
  end

  def destroy
    election_sheet = ElectionSheet.find(params[:id])
    authorize election_sheet
    election_sheet.destroy
  rescue ActiveRecord::RecordNotFound
    election_sheet = ElectionSheet.new(id: params[:id])
    authorize ElectionSheet
  ensure
    render turbo_stream: turbo_stream.remove(election_sheet.id)
  end
end
