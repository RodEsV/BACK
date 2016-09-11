class Product < ApplicationRecord
  has_many :subproducts
  belongs_to :type
  has_and_belongs_to_many :tags
  belongs_to :category
end
