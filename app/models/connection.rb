class Connection < ActiveRecord::Base
  validates :leader, presence:true
  validates :follower, presence:true

  belongs_to :leader, foreign_key: :leader_id, class_name: 'Lover'
  belongs_to :follower, foreign_key: :follower_id, class_name: 'Lover'
end
