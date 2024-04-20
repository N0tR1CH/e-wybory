class CreateElectionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :election_groups do |t|
      t.references :election, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
