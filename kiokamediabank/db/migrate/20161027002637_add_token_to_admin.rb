class AddTokenToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :auth_token, :string, default: ""
    add_index :admins, :auth_token, unique: true
    change_column_default(:admins, :uid, "email")
  end
end
