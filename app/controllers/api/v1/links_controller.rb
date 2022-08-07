class Api::V1::LinksController < Api::V1::ApiController
  def index
    links = Link.unscoped.by_user(@current_user).active.ordered

    render json: links, status: :ok
  end
end
