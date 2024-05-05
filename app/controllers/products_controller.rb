class ProductsController < ApplicationController
  def copy_vendors_as_suppliers
    if Product.copy_vendors_as_suppliers(@user.company)[:success]
      render json: { success: true }, status: :ok
    else
      render json: { errors: @user.company.copy_vendors_as_suppliers[:errors] }, status: :unprocessable_entity
    end
  end
end