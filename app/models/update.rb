class Update < ActiveRecord::Base

  validates :lover, presence: true

  belongs_to :lover

  default_scope { order("updated_at DESC") }

  scope :for_lover, ->(id) { where(lover_id: id) }

  scope :for_artwork_of_lover, ->(id) { where(artwork_id: Artwork.where(artist_id: id)) }
  # the scope above generates the following SQL statement, given an ID being passed in to the lambda expression
  # SELECT * FROM updates WHERE artwork_id IN (SELECT id FROM artworks WHERE artist_id = __ID__) ORDER BY updated_at DESC

  scope :for_leader_of_lover, ->(id) { where(lover_id: Lover.leader_for(id))}

  scope :get_all_for, ->(id) { union(for_lover(id), for_artwork_of_lover(id), for_leader_of_lover(id))}

  def self.union(*scopes)
    ids = scopes.map { |scope| scope.pluck(:id) }.flatten
    where(id: ids.uniq)
  end

end
