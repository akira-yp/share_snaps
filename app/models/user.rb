class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 255}, format:{with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password_digest, presence:true, length:{minimum:6}
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture

  after_initialize :set_defalt_avatar

  def set_defalt_avatar
    self.avatar = File.open("./app/assets/images/f_f_event_75_s128_f_event_75_1bg.png") if avatar.blank?
  end
end
