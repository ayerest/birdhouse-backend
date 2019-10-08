class CreateBirdEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_entries do |t|
      t.references :bird, foreign_key: true
      t.references :field_entry, foreign_key: true

      t.timestamps
    end
  end
end
