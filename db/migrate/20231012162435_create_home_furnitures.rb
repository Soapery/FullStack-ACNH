class CreateHomeFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :home_furnitures do |t|
      t.references :player_home, null: false, foreign_key: true
      t.references :furniture, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
