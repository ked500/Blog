class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50, minimum: 4 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable,
         :omniauthable, omniauth_providers: [:github,:google_oauth2]

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
end
