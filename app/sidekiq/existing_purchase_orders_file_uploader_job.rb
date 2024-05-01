class ExistingPurchaseOrdersFileUploaderJob
  include Sidekiq::Job
  queue_as :default
  REQUIRED_HEADERS = %w(vendor_id po_date po_delivery_date po_shipping_method po_tax_percentage po_status product_id product_quantity)

  def perform(company_id)
    @company = Company.find(company_id)

    access_the_file
    @failed_rows = []
    @product_rows = []
    begin
      if @spreadsheet && check_attributes
        current_po = nil
        @spreadsheet.sheet(0).each_with_index(vendor_id: "vendor_id",order_date: "po_date", delivery_date: "po_delivery_date", shipping_method: "po_shipping_method", tax_percentage: "po_tax_percentage", status: "po_status", product_id: "product_id", product_quantity: "product_quantity") do | row, row_index |
          break if @failed_rows.include?(0)
          next if row_index == 0
          if row[:product_id] && row[:product_quantity]

            @product_rows << {po_id: current_po.id,product_id: row[:product_id], quantity: row[:product_quantity]}
          else
            current_po = @company.purchase_orders.create(vendor_id: row[:vendor_id], order_date: row[:order_date], arrival_date: row[:delivery_date], shipping_method: row[:shipping_method], tax_percent: row[:tax_percentage], status: row[:status].downcase)
          end
        end

        create_product_purchase_orders
      end
    rescue Roo::HeaderRowNotFoundError => e
      @failed_rows << 0
    end
    return @failed_rows , @product_rows

  end

  def create_temp_file
    filename = @company.po_records_file.attachment.blob.filename
    @tmp = Tempfile.new([filename.base, filename.extension_with_delimiter], binmode: true)
    @tmp.write(@company.po_records_file.attachment.blob.download)
    @tmp.rewind
    @tmp
  end
  
  def access_the_file
    @spreadsheet = Roo::Spreadsheet.open(create_temp_file)

  rescue
    @tmp&.unlink
  end

  def check_attributes
    unless (REQUIRED_HEADERS - @spreadsheet.sheet(0).row(1)).blank?
      @failed_rows << 0
      return false
    end
    true
  end

  def create_product_purchase_orders
    
    @product_rows.each do |attributes|
      PurchaseOrder.find(attributes[:po_id]).add_product(Product.find(attributes[:product_id]), attributes[:quantity])
    end
  end

  
end