class RenameUserIdCart < ActiveRecord::Migration[5.0]
  def change
    rename_column :carts, :user_id, :cart_owner_id
    rename_column :sales, :user_id, :buyer_id
  end
end
