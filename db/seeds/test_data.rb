class TestData

  #to-do: turn create to create!
  def self.create
    test_company = Company.create(name: "Test Company", default_lead_time: 63, default_days_of_stock: 63, default_forecasting_days: 63) 

    test_user = test_company.users.create(first_name: "Kerim Can", last_name: "Dağtekin", password: "123456", email: "kcan@example.com")
    test_user = test_company.users.create(first_name: "Burcu", last_name: "Muratoğlu", password: "123456", email: "burcu@example.com")

    warehouse_1 = test_company.warehouses.create(name: "Warehouse 1")
    warehouse_2 = test_company.warehouses.create(name: "Warehouse 2")
    warehouse_3 = test_company.warehouses.create(name: "Warehouse 3")


    supplier_1 = test_company.suppliers.create(name: "supplier 1", phone: "1231231231231", address: "879 Hillview Drive", email: "location1@example.com")
    supplier_2 = test_company.suppliers.create(name: "supplier 2", phone: "4564564564564", address: "2419 Center Avenue", email: "location2@example.com")

    party_jeans = test_company.products.create(name: "Party Jeans", stock: 10, warehouse: warehouse_1, sku: "product1", vendor: "location1", supplier: supplier_1)
    casual_jeans = test_company.products.create(name: "Casual Jeans", stock: 10, warehouse: warehouse_1, sku: "product2", vendor: "location1", supplier: supplier_1)
    white_tshirt = test_company.products.create(name: "Basic White T-Shirt",stock: 50, warehouse: warehouse_2, sku: "product3", vendor: "location2", supplier: supplier_2)
    black_tshirt = test_company.products.create(name: "Basic Black T-Shirt",stock: 40, warehouse: warehouse_2, sku: "product4", vendor: "location2", supplier: supplier_2)
    pink_tshirt = test_company.products.create(name: "Basic Pink T-Shirt",stock: 5, warehouse: warehouse_3, sku: "product5", vendor: "location1", supplier: supplier_1)

    PurchaseOrder.create!(company: test_company, supplier: supplier_1, order_date: Date.today, arrival_date: Date.today + 7, status: 0, warehouse: warehouse_1, shipping_method: "sea", currency: "usd").add_product(party_jeans, 150, 10).add_product(pink_tshirt, 5, 20)
    PurchaseOrder.create!(company: test_company, supplier: supplier_2, order_date: Date.today, arrival_date: Date.today + 7, status: 0, warehouse: warehouse_2, shipping_method: "air", currency: "usd").add_product(casual_jeans, 200, 10)
    PurchaseOrder.create!(company: test_company, supplier: supplier_2, order_date: Date.today, arrival_date: Date.today + 7, status: 0, warehouse: warehouse_3, shipping_method: "road", currency: "usd").add_product(white_tshirt, 5, 20).add_product(black_tshirt, 5, 30)

  end
end