class TestData
  def self.create
    test_company = Company.create!(name: "Test Company", lead_time: 63, days_of_stock: 63, forecasting_days: 63) 

    test_user = test_company.users.create!(first_name: "Kerim Can", last_name: "Dağtekin", password: "123456", email: "kcan@example.com")
    test_user = test_company.users.create!(first_name: "Burcu", last_name: "Muratoğlu", password: "123456", email: "burcu@example.com")

    warehouse_1 = test_company.warehouses.create!(name: "Warehouse 1")
    warehouse_2 = test_company.warehouses.create!(name: "Warehouse 2")
    warehouse_3 = test_company.warehouses.create!(name: "Warehouse 3")

    vendor_1 = test_company.vendors.create!(name: "Vendor 1")
    vendor_2 = test_company.vendors.create!(name: "Vendor 2")

    party_jeans = test_company.products.create!(name: "Party Jeans", price: 200, stock: 10, warehouse: warehouse_1, vendor: vendor_1)
    casual_jeans = test_company.products.create!(name: "Casual Jeans", price: 100, stock: 10, warehouse: warehouse_1, vendor: vendor_2)
    white_tshirt = test_company.products.create!(name: "Basic White T-Shirt", price: 50, stock: 50, warehouse: warehouse_2, vendor: vendor_2)
    black_tshirt = test_company.products.create!(name: "Basic Black T-Shirt", price: 50, stock: 40, warehouse: warehouse_2, vendor: vendor_2)
    pink_tshirt = test_company.products.create!(name: "Basic Pink T-Shirt", price: 60, stock: 5, warehouse: warehouse_3, vendor: vendor_1)

    #test_company.sale_histories.create!(product: party_jeans, price: 100)
    #test_company.sale_histories.create!(product: casual_jeans, price: 50)
    #test_company.sale_histories.create!(product: white_tshirt, price: 10)
    #test_company.sale_histories.create!(product: black_tshirt, price: 10)
    #test_company.sale_histories.create!(product: pink_tshirt, price: 20)

    party_jeans.purchase_orders.create!(company: test_company, supplier: vendor_1, order_date: Date.today, arrival_date: Date.today + 7, status: 0).products_purchase_orders.first.update(quantity: 10)

    casual_jeans.purchase_orders.create!(company: test_company, supplier: vendor_2, order_date: Date.today, arrival_date: Date.today + 7, status: 0).products_purchase_orders.first.update(quantity: 10)

    pink_tshirt.purchase_orders.create!(company: test_company, supplier: vendor_2, order_date: Date.today, arrival_date: Date.today + 7, status: 0).products_purchase_orders.first.update(quantity: 20)

  end
end