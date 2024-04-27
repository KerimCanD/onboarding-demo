class Company < ApplicationRecord
  has_many :bundles, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :purchase_orders, dependent: :destroy
  has_many :sale_histories, dependent: :destroy
  has_many :warehouses, dependent: :destroy
  has_many :vendors, dependent: :destroy
end