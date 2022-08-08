class Api::V1::LinksController < Api::V1::ApiController
  def index
    links = @current_user.bio_link.links.active.ordered

    render json: links, only: [:id, :title, :url, :order], status: :ok
  end
end
