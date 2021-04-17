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
  has_many :active_relationships, foreign_key: 'follower_id', class_name:'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name:'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  after_initialize :set_defalt_avatar

  def set_defalt_avatar
    self.avatar = File.open("./app/assets/images/f_f_event_75_s128_f_event_75_1bg.png") if avatar.blank?
  end

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
end
