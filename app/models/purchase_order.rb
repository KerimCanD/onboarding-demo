class PurchaseOrder < ApplicationRecord
  belongs_to :company
  has_many :products_purchase_orders
  has_many :products, through: :products_purchase_orders
  belongs_to :supplier, class_name: "Vendor", foreign_key: "vendor_id"
end
