class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  scope :non_admins, -> { where admin: false }

  has_one :bio_link, dependent: :destroy

  has_many :links, inverse_of: :user, dependent: :destroy

  before_create :generate_secret_key

  private

  def generate_secret_key
    loop do
      self.secret_key = SecureRandom.uuid
      break unless self.class.exists?(secret_key: self.secret_key)
    end
  end
end
