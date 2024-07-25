class ApplicationController < ActionController::API
  before_action :authenticate_user

  def authenticate_user
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header

    if token
      @current_user = User.find_by(token: token)
      render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
