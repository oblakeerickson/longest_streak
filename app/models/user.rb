class User < ActiveRecord::Base
  include ConnectionHelper
  has_many :contributions
  validates :github_id, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
