class User < ActiveRecord::Base
  validates :github_id, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
