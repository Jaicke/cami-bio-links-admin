class Link < ApplicationRecord
  default_scope { by_user(::Avo::App.context[:user]).ordered }

  belongs_to :bio_link, inverse_of: :links

  validates :order, uniqueness: { scope: :bio_link_id }

  scope :by_user, -> (user) { includes(:bio_link).where(bio_links: { user_id: user.id }) }
  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(order: :asc) }
end
