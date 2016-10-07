class ChangePriceFormatInSales < ActiveRecord::Migration[5.0]
  def change
    change_column :sales, :price, :float
  end
end
