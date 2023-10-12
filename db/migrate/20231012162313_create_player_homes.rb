class CreatePlayerHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :player_homes do |t|
      t.references :player_id, null: false, foreign_key: true
      t.string :size, limit: 10
      t.integer :home_value

      t.timestamps
    end
  end
end
