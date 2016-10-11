class SaleSubproductSerializer < ActiveModel::Serializer
  attributes :quantity, :subproduct
  belongs_to :subproduct
end
