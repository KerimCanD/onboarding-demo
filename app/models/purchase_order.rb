class PurchaseOrder < ApplicationRecord
  belongs_to :company
  has_many :products_purchase_orders
  has_many :products, through: :products_purchase_orders
  has_many :landed_costs, dependent: :destroy
  belongs_to :supplier
  belongs_to :warehouse
  enum status: { pending: 0, shipped: 1, received: 2 }
  enum shipping_method: { sea: 0, air: 1, rail: 2, road: 3 }
  enum currency: {usd: 0, eur: 1, try: 2, cad: 3} #to-do : implement currencies as a table or a class



  def add_product(product, unit_price=0, quantity=0)
    if products_purchase_orders.where(product: product).exists?
      ppo = products_purchase_orders.where(product: product).first
      ppo.update(quantity: ppo.quantity + quantity, unit_price: unit_price)
    else
      products_purchase_orders.create(product: product, quantity: quantity, unit_price: unit_price) 
    end
    return self
  end

end
