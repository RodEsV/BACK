class AddUserToWhishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :whishlists, :user_id, :integer
  end
end
