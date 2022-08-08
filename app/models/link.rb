class Link < ApplicationRecord
  default_scope do
    user = ::Avo::App.context[:user]

    unless user&.admin?
      by_user(user).ordered
    end
  end

  belongs_to :user, inverse_of: :links
  belongs_to :bio_link

  scope :by_user, -> (user) { where(user_id: user.id) }
  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(order: :asc) }

  before_validation :set_user, on: :create, if: -> { user_id.blank? }

  private

  def set_user
    self.user_id = Current.user.id
  end
end
