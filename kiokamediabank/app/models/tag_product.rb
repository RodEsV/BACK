class TagProduct < ApplicationRecord
  self.table_name = "tags_products"
  belongs_to :tag
  belongs_to :product
end
