class Category < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true

  has_many :designations, dependent: :destroy
  has_many :artworks, through: :designations

  has_many :interests, dependent: :destroy
  has_many :lovers, through: :interests
end
