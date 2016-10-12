class Tag < ApplicationRecord
   has_many :tag_products
   has_many :products, through: :tag_products
end
