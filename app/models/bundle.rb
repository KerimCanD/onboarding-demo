class Bundle < ApplicationRecord
  belongs_to :company
  has_many :products_bundles
  has_many :products, through: :products_bundles
end
