class CreateTableCartsSubproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts_subproducts do |t|
      t.integer :cart_id
      t.integer :subproduct_id
    end
  end
end
