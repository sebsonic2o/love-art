require 'bcrypt'

class Lover < ActiveRecord::Base
  include BCrypt

  has_many :likes, dependent: :destroy
  has_many :liked_artworks, through: :likes, source: :artwork

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
