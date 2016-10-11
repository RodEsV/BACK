class WhishlistSubproduct < ApplicationRecord
  self.table_name = "whishlists_subproducts"
  belongs_to :whishlist
  belongs_to :subproduct
  after_initialize :init

  def init
    self.quantity  ||= 0.0           #will set the default value only if it's nil
  end

end
