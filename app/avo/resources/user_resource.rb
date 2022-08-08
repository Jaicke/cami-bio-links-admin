class UserResource < Avo::BaseResource
  self.devise_password_optional = true
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(name_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :bio_link, as: :has_one
  # field :links, as: :has_many

  self.translation_key = 'avo.resource_translations.user'

  self.visible_on_sidebar = false

  field :id, as: :id
  field :name, as: :text, required: true, name: 'Nome', sortable: true
  field :email, as: :text, required: true, name: 'E-mail', sortable: true
  field :secret_key, as: :text, name: 'Secret Key', hide_on: [:new, :edit]
  field :admin, as: :boolean, name: 'Administrador'
  field :password, as: :password, name: 'Senha'
  field :password_confirmation, as: :password, name: 'Confirmação da Senha'
end
