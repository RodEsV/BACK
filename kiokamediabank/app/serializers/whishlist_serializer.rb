class WhishlistSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_many :sale_subproducts
  belongs_to :user
end
