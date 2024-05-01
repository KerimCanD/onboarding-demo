class PurchaseOrder < ApplicationRecord
  belongs_to :company
  has_many :products_purchase_orders
  has_many :products, through: :products_purchase_orders
  belongs_to :supplier, class_name: "Vendor", foreign_key: "vendor_id"
  enum status: { pending: 0, shipped: 1, received: 2 }


  def add_product(product, quantity)
    if products_purchase_orders.where(product: product).exists?
      poo = products_purchase_orders.where(product: product).first
      poo.update(quantity: poo.quantity + quantity)
    else
      products_purchase_orders.create(product: product, quantity: quantity) 
    end
  end

end
