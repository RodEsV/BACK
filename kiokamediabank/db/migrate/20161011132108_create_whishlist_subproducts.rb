class CreateWhishlistSubproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :whishlists_subproducts do |t|
      t.integer :whishlist_id
      t.integer :subproduct_id
      t.integer :quantity
    end
  end
end
