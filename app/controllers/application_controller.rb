class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    @current_user = User.find_by(token: token)

    unless @current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
