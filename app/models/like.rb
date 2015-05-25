class Like < ActiveRecord::Base

  validates :artwork, :lover, presence: true

  belongs_to :artwork
  belongs_to :lover
end
