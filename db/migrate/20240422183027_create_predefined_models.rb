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
      t.references :company, index: true

      t.timestamps
    end

    create_table :products do |t|
      t.references :company, index: true

      t.timestamps
    end

    create_table :warehouses do |t|
      t.references :company, index: true

      t.timestamps
    end

    create_table :vendors do |t|
      t.references :company, index: true

      t.timestamps
    end

    create_table :sale_histories do |t|
      t.references :company, index: true

      t.timestamps
    end

  end
end
