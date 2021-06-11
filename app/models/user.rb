class User < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :pictures
    validates :nickname,  presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                      before_validation { email.downcase! }
                      has_secure_password
                      validates :password, presence: true, length: { minimum: 8 }
                      mount_uploader :my_image, ImageUploader
end
