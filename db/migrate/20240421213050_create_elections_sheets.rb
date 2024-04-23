class CreateElectionsSheets < ActiveRecord::Migration[7.1]
  def change
    create_table :elections_sheets do |t|
      t.string :name
      t.string :description
      t.integer :max_votes_per_user
      t.integer :max_votes_per_candidate
      t.boolean :requires_all_votes_spent

      t.timestamps

      t.references :election, null: false, foreign_key: true
    end
  end
end
