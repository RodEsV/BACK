class RenameUserIdWhishlist < ActiveRecord::Migration[5.0]
  def change
    rename_column :whishlists, :user_id, :whishlist_owner_id
  end
end
