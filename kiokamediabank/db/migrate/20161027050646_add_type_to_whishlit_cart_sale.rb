class AddTypeToWhishlitCartSale < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :cart_owner_type, :string
    add_column :sales, :buyer_type, :string
    add_column :whishlists, :whishlist_owner_type, :string
  end
end
