class Product < ApplicationRecord
  belongs_to :company
  belongs_to :vendor
  belongs_to :warehouse
  has_and_belongs_to_many :bundles
  has_many :products_purchase_orders
  has_many :purchase_orders, through: :products_purchase_orders
end