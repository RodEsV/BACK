class AddProductIdToSubproduct < ActiveRecord::Migration[5.0]
  def change
    add_column :subproducts, :product_id, :integer
  end
end
