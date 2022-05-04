class ProjectResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(name_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :name, as: :text, required: true, name: 'Nome', sortable: true
  field :order, as: :number, required: true, name: 'Ordem'
  field :active, as: :boolean, name: 'Ativo'
  field :description, as: :textarea, required: false, name: 'Descrição'
  field :template, as: :trix, required: true, always_show: false, attachment_key: :attachments, name: 'Template'
  field :cover_photo, as: :file, is_image: true, link_to_resource: true, name: 'Foto de Capa'

  action ToggleActive

  grid do
    cover :cover_photo, as: :file, is_image: true, link_to_resource: true
    title :name, as: :text, link_to_resource: true
    body :description, as: :text
  end
end
