class Designation < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :category
end
