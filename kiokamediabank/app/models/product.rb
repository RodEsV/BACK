class Product < ApplicationRecord
  has_many :subproducts
  belongs_to :type

  has_many :tag_products
  has_many :tags, through: :tag_products

  belongs_to :category
end
