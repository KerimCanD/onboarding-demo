class CreatePredefinedModels < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :lead_time
      t.integer :days_of_stock
      t.integer :forecasting_days

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
      t.float :price
      t.integer :stock, default: 0
      t.belongs_to :vendor
      t.belongs_to :warehouse

      t.timestamps
    end

    create_table :warehouses do |t|
      t.belongs_to :company
      t.string :name

      t.timestamps
    end

    create_table :vendors do |t|
      t.belongs_to :company
      t.string :name
      t.string :phone
      t.string :address
      t.string :zip

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
