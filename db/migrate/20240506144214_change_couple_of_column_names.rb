class ChangeCoupleOfColumnNames < ActiveRecord::Migration[7.1]
  def self.up
    rename_column :election_sheet_candidates, :elections_sheet_id, :election_sheet_id

    rename_column :election_sheet_user_votes, :elections_sheet_id, :election_sheet_id
  end

  def self.down
    rename_column :election_sheet_candidates, :election_sheet_id, :elections_sheet_id

    rename_column :election_sheet_user_votes, :election_sheet_id, :elections_sheet_id
  end
end
