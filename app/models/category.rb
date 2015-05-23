class Category < ActiveRecord::Base
  has_many :designations, dependent: :destroy
  has_many :artworks, through: :designations

  has_many :interests, dependent: :destroy
  has_many :lovers, through: :interests
end
