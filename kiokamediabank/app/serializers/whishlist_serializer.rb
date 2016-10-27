class WhishlistSerializer < ActiveModel::Serializer
  attributes :id
  has_many :whishlist_subproducts
  belongs_to :whishlist_owner, polymorphic: true
end
