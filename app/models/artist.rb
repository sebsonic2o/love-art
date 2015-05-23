class Artist < Lover
  has_many :artworks, dependent: :destroy
end
