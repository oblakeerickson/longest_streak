namespace :streaks do
  desc "Fetch Longest Streak for GitHub Users"
  task populate: :environment do
    rate_limit = 5000
    connection = Connection.new
    last = User.where.not(longest_streak: nil).maximum(:id)
    User.find_each(start: last, batch_size: 10) do |user|
      contribution = Contribution.new(user.username)
      user.update_attribute(:longest_streak, contribution.longest_streak)
    end
  end
end
