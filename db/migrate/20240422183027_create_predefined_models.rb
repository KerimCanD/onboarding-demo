class CreatePredefinedModels < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|

      t.timestamps
    end

    create_table :company do |t|

      t.timestamps
    end

    create_table :product do |t|

      t.timestamps
    end

    create_table :warehouses do |t|

      t.timestamps
    end

    create_table :vendors do |t|

      t.timestamps
    end

    create_table :sale_histories do |t|

    end

  end
end
