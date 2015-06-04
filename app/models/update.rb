class Update < ActiveRecord::Base

  validates :lover, presence: true

  belongs_to :lover
end
