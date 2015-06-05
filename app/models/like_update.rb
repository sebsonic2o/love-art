class LikeUpdate < Update

  validates :artwork, presence: true

  belongs_to :artwork

  before_create :defaults

  def defaults
    self.text = "Liked artwork #{self.artwork.title}"
  end
end