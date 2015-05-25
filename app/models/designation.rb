class Designation < ActiveRecord::Base

  validates :artwork, :category, presence: true

  belongs_to :artwork
  belongs_to :category
end
