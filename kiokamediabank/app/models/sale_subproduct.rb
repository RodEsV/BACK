class SaleSubproduct < ApplicationRecord
  self.table_name = "sales_subproducts"
  belongs_to :sale
  belongs_to :subproduct
  after_initialize :init

  def init
    self.quantity  ||= 0.0           #will set the default value only if it's nil
  end
end
