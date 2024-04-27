class CreateBundles < ActiveRecord::Migration[7.1]
  def change
    create_table :bundles do |t|
      t.belongs_to :company
      t.string :name
      t.float :price

      t.timestamps
    end

    create_join_table :products, :bundles do |t|
      t.index [:product_id, :bundle_id]
      t.index [:bundle_id, :product_id]
      t.integer :quantity
    end
  end
end
