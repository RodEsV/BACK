class SaleSerializer < ActiveModel::Serializer
  attributes :id
  has_many :sale_subproducts
  belongs_to :buyer, polymorphic: true
end
