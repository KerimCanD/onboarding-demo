class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  before_action :authorized
  
  def encode_token(payload)
    JWT.encode(payload, "password")
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
        token = header.split(" ")[1]
        begin
            JWT.decode(token, 'password')
        rescue JWT::DecodeError
            nil
        end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end


  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless current_user.present?
  end

  private

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
