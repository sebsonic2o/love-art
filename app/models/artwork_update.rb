class ArtworkUpdate < Update

  validates :artwork, presence: true

  belongs_to :artwork

  before_create :defaults

  def defaults
    self.lover = self.artwork.artist
    self.text = "Added artwork #{self.artwork.title}"
  end
end