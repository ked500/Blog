class User < ApplicationRecord
  rolify
  has_many :microposts, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 50, minimum: 10 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]
  after_create :assign_default_role


  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    unless user
      user = User.create(name: access_token.info.name,
                         email: access_token.info.email,
                         password: Devise.friendly_token[0, 20])
    end

    user.skip_confirmation!
    user
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id",user_id: id)
  end

  private

  def assign_default_role
    self.add_role(:default) if self.roles.blank?
  end
end
