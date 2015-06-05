class Update < ActiveRecord::Base
  default_scope { order("updated_at DESC") }

  validates :lover, presence: true

  belongs_to :lover

  scope :for_lover, ->(id) { where(lover_id: id) }

  scope :for_artwork_of_lover, ->(id) { where(artwork_id: Artwork.where(artist_id: id)) }
  # the scope above generates the following SQL statement, given an ID being passed in to the lambda expression
  # SELECT * FROM updates WHERE artwork_id IN (SELECT id FROM artworks WHERE artist_id = __ID__) ORDER BY updated_at DESC


  # scope :get_all_for, ->(id) { }


end
