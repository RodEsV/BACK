class CreateTableSalesSubproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_subproducts do |t|
      t.integer :sale_id
      t.integer :subproduct_id
    end
  end
end
