class ProductSerializer < ActiveModel::Serializer
  attributes :name, :image_link, :id
  #has_many :subproducts
  belongs_to :type
  #has_many :tags
  belongs_to :category
end
