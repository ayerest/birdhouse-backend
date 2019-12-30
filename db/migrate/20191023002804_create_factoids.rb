class CreateFactoids < ActiveRecord::Migration[5.2]
  def change
    create_table :factoids do |t|
      t.string :fact

      t.timestamps
    end
  end
end
