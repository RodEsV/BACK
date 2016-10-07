class CartSerializer < ActiveModel::Serializer
  attributes :date
  has_many :subproducts
  belongs_to :user
end
