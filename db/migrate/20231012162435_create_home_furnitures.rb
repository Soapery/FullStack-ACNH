class CreateHomeFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :home_furnitures do |t|
      t.references :home, null: false, foreign_key: true
      t.references :furniture, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end

    add_index :home_furnitures, [:home_id, :furniture_id], unique: true
  end
end