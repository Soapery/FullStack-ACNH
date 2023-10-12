class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :username, limit: 50
      t.string :gender, limit: 10
      t.string :email, limit: 50
      t.date :birthday
      t.integer :bells

      t.timestamps
    end
  end
end
