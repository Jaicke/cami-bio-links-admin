class Api::V1::LinksController < Api::V1::ApiController
  def index
    links = Link.by_user(@current_user).active.ordered

    render json: links, only: [:id, :title, :url, :order], status: :ok
  end
end
