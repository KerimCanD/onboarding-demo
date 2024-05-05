class CreatePredefinedModels < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :default_lead_time
      t.integer :default_days_of_stock
      t.integer :default_forecasting_days

      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.belongs_to :company

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.belongs_to :company
      t.integer :stock, default: 0
      t.belongs_to :supplier
      t.belongs_to :warehouse
      t.string :sku
      t.string :vendor
      t.integer :days_of_stock
      t.integer :lead_time
      t.integer :forecasting_days

      t.timestamps
    end

    create_table :warehouses do |t|
      t.belongs_to :company
      t.string :name

      t.timestamps
    end

    create_table :suppliers do |t|
      t.belongs_to :company
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :tax_number

      t.timestamps
    end

  

    create_table :sale_histories do |t|
      t.belongs_to :company
      t.belongs_to :product
      t.float :price

      t.timestamps
    end

  end
end
