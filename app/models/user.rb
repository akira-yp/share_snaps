class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, format:{with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password_digest, presence:true, length:{minimum:6}
  has_many :pictures
  has_many :favorites, dependent: :destroy
end
