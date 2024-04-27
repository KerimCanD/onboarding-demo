class Vendor < ApplicationRecord
  belongs_to :company
  has_many :products
end