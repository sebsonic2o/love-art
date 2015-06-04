class LikeUpdate < Update

  validates :artwork, presence: true

  belongs_to :artwork

  after_initialize :defaults

  def defaults
    self.text = "Liked artwork #{self.artwork.title}"
  end
end