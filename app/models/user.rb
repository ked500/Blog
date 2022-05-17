class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50, minimum: 4}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable
end
