class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :field_entry, foreign_key: true
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
