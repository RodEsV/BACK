class AddPriceToSubproducts < ActiveRecord::Migration[5.0]
  def change
    add_column :subproducts, :price, :float
  end
end
