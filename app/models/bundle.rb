class Bundle < ApplicationRecord
  has_many :products_bundles
  has_many :products, through: :products_bundles
end
