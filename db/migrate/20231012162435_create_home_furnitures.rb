class CreateHomeFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :home_furnitures do |t|
      t.references :home, null: false, foreign_key: true
      t.references :furniture, null: false, foreign_key: true
      t.integer :amount #Fix amount not showing up? Check for issues with amount showing up in model after migration

      t.timestamps
    end

    add_index :home_furnitures, [:home_id, :furniture_id], unique: true
  end
end