class CartSerializer < ActiveModel::Serializer
  attributes :date, :id
  has_many :cart_subproducts
  belongs_to :user
end
