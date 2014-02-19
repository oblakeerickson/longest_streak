namespace :users do
  desc "Fetch users from GitHub"
  task populate: :environment do
    last = User.last.github_id
    rate_limit = 5000
    connection = Connection.new
    puts connection.username
    while rate_limit > 10 do
      list = connection.user_list(last)
      list.each do |u|
        user = User.new
        my_user = GithubUser.new(u)
        user = User.new(username: my_user.login, github_id: my_user.id)
        user.save
        my_user.print
        last = connection.last_user list
      end
    end
  end
end
