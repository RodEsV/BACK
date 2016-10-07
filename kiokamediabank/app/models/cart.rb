class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subproducts,
  class_name: 'Subproduct',
  join_table: "carts_subproducts",
  foreign_key: :subproduct_id,
  :association_foreign_key => :cart_id
end
