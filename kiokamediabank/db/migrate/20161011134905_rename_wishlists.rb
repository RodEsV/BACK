class RenameWishlists < ActiveRecord::Migration[5.0]
  def change
    rename_table :wishlists, :whishlists
  end
end
