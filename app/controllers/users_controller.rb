class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  #before_action :set_user, only: %i[ show update destroy ]


  def show 
    render json: current_user, status: :ok
  end

  def create 
    company = Company.create!(user_params[:company])
    user = User.create!(user_params.except(:company).merge(company_id: company.id))
    @token = encode_token(user_id: user.id)
    render json: {
        user: UserSerializer.new(user), 
        token: @token
    }, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:first_name, :last_name, :company_id, :password, :email, company: [:name, :lead_time, :days_of_stock, :forecasting_days])
    end
end
