class Link < ApplicationRecord
  default_scope { by_user(::Avo::App.context[:user]) }

  belongs_to :bio_link, inverse_of: :links

  scope :by_user, -> (user) { includes(:bio_link).where(bio_links: { user_id: user.id }) }
  scope :active, -> { where(active: true) }
end
