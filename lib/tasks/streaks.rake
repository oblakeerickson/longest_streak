namespace :streaks do
  desc "Fetch Longest Streak for GitHub Users"
  task populate: :environment do
    rate_limit = 5000
    connection = Connection.new
    last = 0
    User.find_each(start: last, batch_size: 10) do |user|
      page = Page.new(user.username)
      if page.streak != "error"
        if user.longest_streak
          if page.streak.to_i >= user.longest_streak
            user.update_attribute(:longest_streak, page.streak)
          end
        else
          user.update_attribute(:longest_streak, page.streak)
        end
      end
    end
  end
end
