class Whishlist < ApplicationRecord
  belongs_to :whishlist_owner, polymorphic: true
  has_many :whishlist_subproducts
  has_many :subproducts, through: :whishlist_subproducts
end
