class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :company, index: true
      t.integer :status
      t.belongs_to :supplier, index: true
      t.date :order_date
      t.date :arrival_date
      t.integer :shipping_method
      t.belongs_to :warehouse
      t.string :tracking_code
      t.integer :currency
      
      t.timestamps
    end

    create_table :products_purchase_orders do |t|
      t.belongs_to :product
      t.belongs_to :purchase_order
      t.index [:product_id, :purchase_order_id]
      t.index [:purchase_order_id, :product_id]
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
    
    create_table :landed_costs do |t|
      t.belongs_to :purchase_order
      t.float :cost
      t.integer :cost_type
    end
    
    
  end
end
