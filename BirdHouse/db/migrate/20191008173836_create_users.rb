class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :avatar
      t.datetime :last_login
      t.integer :step_count, :default => 0

      t.timestamps
    end
  end
end
