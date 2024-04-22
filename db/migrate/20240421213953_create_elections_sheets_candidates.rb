class CreateElectionsSheetsCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :elections_sheets_candidates do |t|
      t.string :name
      t.bigint :votes

      t.references :elections_sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
