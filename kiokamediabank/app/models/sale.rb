class Sale < ApplicationRecord
  belongs_to :buyer, polymorphic: true
  has_many :sale_subproducts
  has_many :subproducts, through: :sale_subproducts
end
