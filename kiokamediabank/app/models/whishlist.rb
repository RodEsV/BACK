class Whishlist < ApplicationRecord
  belongs_to :user
  has_many :whishlist_subproducts
  has_many :subproducts, through: :whishlist_subproducts
end
