class BioLink < ApplicationRecord
  default_scope do
    user = ::Avo::App.context[:user]

    unless user&.admin?
      by_user(user)
    end
  end

  belongs_to :user

  has_many :links, inverse_of: :bio_link, dependent: :nullify

  scope :by_user, -> (user) { where(user_id: user.id) }
end
