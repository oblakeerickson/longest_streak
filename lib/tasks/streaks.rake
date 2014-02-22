namespace :streaks do
  desc "Fetch Longest Streak for GitHub Users"
  task populate: :environment do
    rate_limit = 5000
    connection = Connection.new
    User.find_each(batch_size: 10) do |user|
      contribution = Contribution.new(user.username)
      user.update_attribute(:longest_streak, contribution.longest_streak)
    end
  end
end
