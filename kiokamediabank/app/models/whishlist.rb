class Whishlist < ApplicationRecord
  belongs_to :user
  has_many :sale_subproducts
  has_many :subproduts, through: :whishlist_subproducts
end
