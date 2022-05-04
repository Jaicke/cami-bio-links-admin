class Project < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :attachments

  validates :name, :order, :template, presence: true
  validates :order, numericality: { only_integer: true,  greater_than: 0 }
end
