class Artwork < ActiveRecord::Base

  validates :artist, :title, :image_url, presence: true

  has_many :designations, dependent: :destroy
  has_many :categories, through: :designations

  has_many :likes, dependent: :destroy
  has_many :lovers, through: :likes

  belongs_to :artist
end
