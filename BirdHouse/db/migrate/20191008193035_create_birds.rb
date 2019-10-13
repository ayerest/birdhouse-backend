class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :common_name
      t.string :species_name
      t.string :img_url
      t.string :range_map
      t.string :details
      t.string :category
      t.string :birdcall

      t.timestamps
    end
  end
end
