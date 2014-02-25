namespace :large_streaks do
  desc "Fetch Longest Streak for Github Users with streaks greater than 365"
  task populate: :environment do
    rate_limit = 5000
    connection = Connection.new
    User.where('longest_streak > 365').find_each(batch_size: 10) do |user|
      page = Page.new(user.username)
      if page.streak != "error"
        user.update_attribute(:longest_streak, page.streak)
      end
    end
  end
end
