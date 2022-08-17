class Api::V1::LinksController < Api::V1::ApiController
  def index
    links = @current_user.bio_link.links.active.ordered

    render json: links, only: [:id, :title, :url, :order], status: :ok
  end

  # Idealização caso precise implementar agrupamento de links
  # def grouped_links
  #   groups = @current_user.bio_link.groups
  #     Ex
  #     [
  #       {
  #         "id": 1,
  #         "name": 'Loja 1',
  #         "order": 1,
  #         "links": [
  #           {
  #             "id": 1,
  #             "title": 'Whatsapp',
  #             "url": 'whatsapp.com/2323232',
  #             "order": 1
  #           }
  #         ]
  #       },
  #       {
  #         "id": 2,
  #         "name": 'Loja 2',
  #         "order": 2,
  #         "links": [
  #           {
  #             "id": 2,
  #             "title": 'Whatsapp',
  #             "url": 'whatsapp.com/1111111',
  #             "order": 1
  #           }
  #         ]
  #       }
  #     ]
  #   render json: groups, only: [:id, :name, :order, :links]
  # end
end
