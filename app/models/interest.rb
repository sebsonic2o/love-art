class Interest < ActiveRecord::Base
  belongs_to :category
  belongs_to :lover
end
