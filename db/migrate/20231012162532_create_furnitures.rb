class CreateFurnitures < ActiveRecord::Migration[7.0]
  def change
    create_table :furnitures do |t|
      t.string :name, limit: 50
      t.string :variation, limit: 50
      t.string :pattern, limit: 50
      t.integer :price
      t.boolean :diy

      t.timestamps
    end
  end
end
