class CartSerializer < ActiveModel::Serializer
  attributes :id
  has_many :cart_subproducts
  belongs_to :cart_owner, polymorphic: true
end
