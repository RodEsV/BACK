class AddQuantityToCartsSubproducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts_subproducts, :quantity, :integer
  end
end
