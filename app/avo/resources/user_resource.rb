class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(name_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :bio_link, as: :has_one

  self.translation_key = 'avo.resource_translations.user'

  self.visible_on_sidebar = false

  field :id, as: :id
  field :name, as: :text, required: true, name: 'Nome', sortable: true
  field :email, as: :text, required: true, name: 'E-mail', sortable: true
  field :secret_key, as: :text, name: 'Secret Key', visible: -> (resource:) { Current.user.admin? }, readonly: true
  field :admin, as: :boolean, name: 'Administrador', visible: -> (resource:) { Current.user.admin? }
  field :password, as: :password, name: 'Senha', hide_on: [:edit]
  field :password_confirmation, as: :password, name: 'Confirmação da Senha', hide_on: [:edit]
end
