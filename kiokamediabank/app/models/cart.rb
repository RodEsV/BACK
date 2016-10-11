class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_subproducts
  has_many :subproducts, through: :cart_subproducts
  after_initialize :init

  def init
    self.date  ||= Time.now
  end

  def compute_price
    price = 0
    for subproduct in self.subproducts
      price = price + subproduct.price
    end
    price
  end

  # has_and_belongs_to_many :subproducts,
  # class_name: 'Subproduct',
  # join_table: "carts_subproducts",
  # foreign_key: :subproduct_id,
  # :association_foreign_key => :cart_id
end
