class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.references :product, index: true
      t.integer :status
      t.references :vendor, index: true
      t.date :order_date
      t.date :arrival_date
      t.float :total_amount

      t.timestamps
    end
  end
end
