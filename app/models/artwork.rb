class Artwork < ActiveRecord::Base

  validates :artist, :title, :image_url, presence: true

  has_many :designations, dependent: :destroy
  has_many :categories, through: :designations

  has_many :like_updates, dependent: :destroy
  has_many :lovers, through: :like_updates

  has_many :artwork_updates, dependent: :destroy

  belongs_to :artist

  after_create :create_update

  def create_update
     self.artwork_updates.create(lover_id: self.artist.id)
  end
end
