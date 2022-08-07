class Api::V1::ApiController < ApplicationController
  before_action :authorize_request

  def authorize_request
    secret_key = request.headers['X-Secret-Key']

    @current_user = User.find_by!(secret_key: secret_key)
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end
