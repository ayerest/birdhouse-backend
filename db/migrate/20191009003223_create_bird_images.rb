class CreateBirdImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bird_images do |t|
      t.references :bird, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
