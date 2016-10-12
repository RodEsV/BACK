class CreateTableTagsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_products do |t|
      t.integer :tag_id
      t.integer :product_id
    end
  end
end
