class LandedCost < ApplicationRecord
  belongs_to :purchase_order
  enum cost_type: { duty_cost: 0, freight_cost: 1, insurance_fee: 2 }
end