class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :company, index: true
      t.integer :status
      t.belongs_to :vendor, index: true #alias as supplier
      t.date :order_date
      t.date :arrival_date
      
      t.timestamps
    end

    create_join_table :products, :purchase_orders do |t|
      t.index [:product_id, :purchase_order_id]
      t.index [:purchase_order_id, :product_id]
      t.integer :quantity
    end
    
    
  end
end
