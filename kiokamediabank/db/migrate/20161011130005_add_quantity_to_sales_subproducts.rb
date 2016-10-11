class AddQuantityToSalesSubproducts < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_subproducts, :quantity, :integer
  end
end
