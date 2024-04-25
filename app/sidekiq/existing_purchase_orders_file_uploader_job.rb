class ExistingPurchaseOrdersFileUploaderJob
  include Sidekiq::Job
  queue_as :default

  def perform(xlsx_path)
    file = Roo:SpreadSheet.open(path[:xlsx_path])
    file.sheet(0).each_with_index(product: "product", status: "status", vendor: "vendor", order_date: "order_date", arrival_date: "arrival_date", total_amount: "total_amount") do | row, row_index |
      next if row_index == 0

      PurchaseOrder.create(
        product: row[:product],
        status: row[:status],
        vendor: row[:vendor],
        order_date: row[:order_date],
        arrival_date: row[:arrival_date],
        total_amount: row[:total_amount]
        )
    end
  end
end
