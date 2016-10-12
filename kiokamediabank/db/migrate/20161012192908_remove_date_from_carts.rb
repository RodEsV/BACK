class RemoveDateFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :date, :date
    remove_column :sales, :date, :date
  end
end
