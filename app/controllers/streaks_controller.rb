class StreaksController < ApplicationController
  def index
    @users = User.where.not(longest_streak:nil).limit(50).order(longest_streak: :desc)
    @count = Rails.cache.fetch("count", :expires_in => 4.hours) do
      User.count
    end
    @longest_streak_count = Rails.cache.fetch("longest_streak_count", :expires_in => 4.hours) do
      User.count(:longest_streak)
    end
  end
end
