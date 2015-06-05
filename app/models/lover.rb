require 'bcrypt'

class Lover < ActiveRecord::Base
  include BCrypt

  validates :alias, :email, uniqueness: true, presence: true
  validates :password_hash, presence: true

  has_many :follower_connections, foreign_key: :follower_id, class_name: "Connection", dependent: :destroy
  has_many :leaders, through: :follower_connections, source: :leader

  has_many :leader_connections, foreign_key: :leader_id, class_name: "Connection", dependent: :destroy
  has_many :followers, through: :leader_connections, source: :follower

  has_many :like_updates, dependent: :destroy
  has_many :liked_artworks, through: :like_updates, source: :artwork

  has_many :custom_updates, dependent: :destroy

  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
