class BioLinkResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(name_i_cont: params[:q], m: "or").result(distinct: false)
  end

  field :user, as: :belongs_to, attach_scope: -> { query.non_admins }, hide_on: [:show]
  field :links, as: :has_many

  field :id, as: :id, visible: -> (resource:) { context[:user].admin? }
  field :name, as: :text, sortable: true, placeholder: 'bio.camidesign.com.br', name: 'Nome'

  self.translation_key = 'activerecord.models.bio_link'
end
