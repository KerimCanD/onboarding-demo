class Company < ApplicationRecord
  has_many :users
  has_many :products
  has_many :warehouses
  has_many :vendors
end