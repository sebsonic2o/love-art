class ArtworkUpdate < Update

  validates :artwork, presence: true

  belongs_to :artwork

  after_initialize :defaults

  def defaults
    self.lover = self.artwork.artist
    self.text = "Added artwork #{self.artwork.title}"
  end
end