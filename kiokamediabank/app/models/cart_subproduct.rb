class CartSubproduct < ApplicationRecord
  self.table_name = "carts_subproducts"
  belongs_to :cart
  belongs_to :subproduct
  after_initialize :init
  # validate :quantity?
  # before_save :remove_subproduct, if: :no_subproducts_in_cart?

  def remove_subproduct
    self.cart.subproducts.destroy(self.subproduct)
    self.destroy
  end

  def quantity?
    if self.quantity < 0
      errors.add(:quantity, "should be <= 0")
    end
  end

  def init
    self.quantity  ||= 0.0           #will set the default value only if it's nil
  end

end
