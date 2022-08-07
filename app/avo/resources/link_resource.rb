class LinkResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :bio_link, as: :belongs_to

  field :id, as: :id, as: :hidden, required: true
  field :title, as: :text, name: 'Título', required: true, sortable: true
  field :url, as: :text, name: 'URL', required: true
  field :order, as: :number, name: 'Ordem', required: true
  field :active, as: :boolean, name: 'Ativo'

  # Actions
  action ToggleActive

  # Setup
  self.visible_on_sidebar = false
  self.translation_key = 'activerecord.models.link'
end
