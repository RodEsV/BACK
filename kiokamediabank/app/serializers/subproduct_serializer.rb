class SubproductSerializer < ActiveModel::Serializer
  attributes :id, :resolution, :price
  belongs_to :product
end
