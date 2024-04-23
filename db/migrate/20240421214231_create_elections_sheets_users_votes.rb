class CreateElectionsSheetsUsersVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :elections_sheets_users_votes, id: false do |t|
      t.references :elections_sheet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    execute "ALTER TABLE elections_sheets_users_votes ADD PRIMARY KEY (elections_sheet_id, user_id);"
  end
end
