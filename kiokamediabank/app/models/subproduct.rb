class Subproduct < ApplicationRecord
  belongs_to :product
  has_and_belongs_to_many :sales
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :wishlists
end
