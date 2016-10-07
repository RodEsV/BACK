class Subproduct < ApplicationRecord
  belongs_to :product
  has_and_belongs_to_many :sales
  has_and_belongs_to_many :carts,
  :class_name => 'Cart',
  :join_table => "carts_subproducts",
  :foreign_key => :cart_id,
  :association_foreign_key => :subproduct_id
  has_and_belongs_to_many :wishlists
end
