class BioLink < ApplicationRecord
  belongs_to :user

  has_many :links, inverse_of: :bio_link

  scope :by_user, -> (user) { where(user_id: user.id) }
end
