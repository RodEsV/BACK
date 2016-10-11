class SaleSubproduct < ApplicationRecord
  self.table_name = "sales_subproducts"
  belongs_to :sale
  belongs_to :subproduct
end
