class CreateBundles < ActiveRecord::Migration[7.1]
  def change
    create_table :bundles do |t|

      t.timestamps
    end
  end
end
