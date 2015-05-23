class Artwork < ActiveRecord::Base
  has_many :designations, dependent: :destroy
  has_many :categories, through: :designations

  has_many :likes, dependent: :destroy
  has_many :lovers, through: :likes

  belongs_to :artist
end
