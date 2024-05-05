class RenameElectionsSheetsCandidatesTableNameToElectionSheetCandidates < ActiveRecord::Migration[7.1]
  def self.up
    rename_table :elections_sheets_candidates, :election_sheet_candidates
  end

  def self.down
    rename_table :election_sheet_candidates, :elections_sheets_candidates
  end
end
