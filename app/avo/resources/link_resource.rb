class LinkResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(title_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :bio_link, as: :belongs_to
  field :user, as: :belongs_to, visible: -> (resource:) { context[:user].admin? }, required: true

  field :id, as: :id, as: :hidden, required: true, sortable: true
  field :title, as: :text, name: 'Título', placeholder: 'Título', required: true, sortable: true
  field :url, as: :text, name: 'URL', placeholder: 'URL', required: true, sortable: true
  field :order, as: :number, name: 'Ordem', placeholder: 'Ordem', required: true, sortable: true
  field :active, as: :boolean, name: 'Ativo', sortable: true

  # Actions
  action ToggleActive

  # Filters
  filter ActivedFilter

  # Setup
  self.visible_on_sidebar = true
  self.translation_key = 'activerecord.models.link'
end
