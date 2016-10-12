class SaleSerializer < ActiveModel::Serializer
  attributes :id
  has_many :sale_subproducts
  belongs_to :user
end
