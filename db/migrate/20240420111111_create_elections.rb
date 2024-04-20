class CreateElections < ActiveRecord::Migration[7.1]
  def change
    create_table :elections do |t|
      t.string :name
      t.text :description
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
