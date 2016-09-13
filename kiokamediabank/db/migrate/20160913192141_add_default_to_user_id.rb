class AddDefaultToUserId < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :uid, "email")
  end
end
