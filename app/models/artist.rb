class Artist < Lover

  has_many :artworks, dependent: :destroy

  has_many :artwork_updates, foreign_key: :lover_id, dependent: :destroy
end
