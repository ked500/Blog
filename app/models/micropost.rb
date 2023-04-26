class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140, minimum: 1}
end
