class CorrectProductsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :resolution
      t.string :image_link
      t.float :price
      t.boolean :active

      t.timestamps
    end
  end
end
