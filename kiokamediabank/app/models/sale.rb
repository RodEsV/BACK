class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_subproducts
  has_many :subproducts, through: :sale_subproducts
end
