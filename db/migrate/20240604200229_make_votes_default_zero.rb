class MakeVotesDefaultZero < ActiveRecord::Migration[7.1]
  def change
    change_column :election_sheet_candidates, :votes, :bigint, null: false, default: 0
  end
end
