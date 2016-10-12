class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_subproducts
  has_many :subproducts, through: :cart_subproducts

  def compute_price
    price = 0
    for subproduct in self.subproducts
      price = price + subproduct.price
    end
    price
  end

end
