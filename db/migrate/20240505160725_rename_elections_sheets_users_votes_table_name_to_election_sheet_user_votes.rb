class RenameElectionsSheetsUsersVotesTableNameToElectionSheetUserVotes < ActiveRecord::Migration[7.1]
  def self.up
    rename_table :elections_sheets_users_votes, :election_sheet_user_votes
  end

  def self.down
    rename_table :election_sheet_user_votes, :elections_sheets_users_votes
  end
end
