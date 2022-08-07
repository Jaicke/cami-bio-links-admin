class LinkResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :bio_link, as: :belongs_to

  field :id, as: :id, as: :hidden
  field :title, as: :text, name: 'Título', sortable: true
  field :url, as: :text, name: 'URL'
  field :active, as: :boolean, name: 'Ativo'

  # Actions
  action ToggleActive

  # Setup
  self.visible_on_sidebar = false
  self.translation_key = 'activerecord.models.link'
end
