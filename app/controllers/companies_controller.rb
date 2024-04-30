class CompaniesController < ApplicationController
  before_action :set_company

  def update_lead_time
    @company.update(lead_time: params[:lead_time]) ? (render json: @company) : (render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity)
  end

  def update_days_of_stock
    @company.update(days_of_stock: params[:days_of_stock]) ? (render json: @company) : (render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity)
  end

  def update_forecasting_days
    @company.update(forecasting_days: params[:forecasting_days]) ? (render json: @company) : (render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity)
  end

  # GET /companies/1
  def show
    render json: @company
  end



  private
    def set_company
      @company = @user.company
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :lead_time, :days_of_stock, :forecasting_days, :file)
    end
end