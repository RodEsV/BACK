class AddIdToType < ActiveRecord::Migration[5.0]
  def change
    add_column :types, :type_id, :integer
  end
end
