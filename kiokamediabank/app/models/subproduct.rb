class Subproduct < ApplicationRecord
  belongs_to :product

  has_many :cart_subproducts
  has_many :carts, through: :cart_subproducts

  has_many :sale_subproducts
  has_many :sales, through: :sale_subproducts

  has_and_belongs_to_many :wishlists
end
