class AddDefaultToAuthToken < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :auth_token, "")
  end
end
