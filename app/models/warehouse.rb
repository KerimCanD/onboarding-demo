class Warehouse < ApplicationRecord
  belongs_to :company
  has_many :products, dependent: :destroy
end