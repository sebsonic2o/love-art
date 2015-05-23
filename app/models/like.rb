class Like < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :lover
end
