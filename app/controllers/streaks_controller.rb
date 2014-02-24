class StreaksController < ApplicationController

  def index
    @users = User.where.not(longest_streak:nil).limit(20).order(longest_streak: :desc)
    @count = User.count
    @longest_streak_count = User.count(:longest_streak)
  end
end
