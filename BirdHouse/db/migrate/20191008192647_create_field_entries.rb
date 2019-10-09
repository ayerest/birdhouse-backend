class CreateFieldEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :field_entries do |t|
      t.text :notes
      t.references :user, foreign_key: true
      t.datetime :date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
