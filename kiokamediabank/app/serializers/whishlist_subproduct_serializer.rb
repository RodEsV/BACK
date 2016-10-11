class WhishlistSubproductSerializer < ActiveModel::Serializer
  attributes :quantity, :subproduct
  belongs_to :subproduct
end
