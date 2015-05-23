class Lover < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :liked_artworks, through: :likes, source: :artwork

  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests
end
