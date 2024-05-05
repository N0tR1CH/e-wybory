class RenameElectionsSheetsTableNameToElectionSheets < ActiveRecord::Migration[7.1]
  def self.up
    rename_table :elections_sheets, :election_sheets
  end

  def self.down
    rename_table :election_sheets, :elections_sheets
  end
end
