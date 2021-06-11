class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :image, presence: true
  validates :content, presence: true, length: { in: 1..200 }
end
