class Contribution < ActiveRecord::Base
  belongs_to :user
  validates :contributed_on, presence: true
  validates :contribution_count, presence: true
  validates :user_id, presence: true
end
