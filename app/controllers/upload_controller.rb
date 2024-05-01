class UploadController < ApplicationController
  before_action -> {ActiveStorage::Current.url_options = { protocol: "http", host: "localhost", port: 3000 }}
  before_action :set_company

  def upload_pos
    if @company.update(po_records_file: params[:file]) && @company.po_records_file.attached?
      ExistingPurchaseOrdersFileUploaderJob.perform_async(@user.company.id)
      render json: { message: "File uploaded successfully" }, status: :ok
    else
      render json: { message: "File upload failed" }, status: :unprocessable_entity
    end
  end

  private
    def product_order_params
      params.permit(:file)
    end

    def set_company
      @company = @user.company
    end
end
