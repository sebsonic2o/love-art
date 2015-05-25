class Interest < ActiveRecord::Base

  validates :category, :lover, presence: true

  belongs_to :category
  belongs_to :lover
end
