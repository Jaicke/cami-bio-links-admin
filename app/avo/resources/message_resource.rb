class MessageResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(name_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :name, as: :text, required: true, name: 'Nome', sortable: true
  field :email, as: :text, required: true, name: 'Email', sortable: true
  field :answered, as: :boolean, required: false, name: 'Respondido'
  field :content, as: :textarea, required: true, name: 'Conteúdo'

  action ToggleAnswered
end
