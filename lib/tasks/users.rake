namespace :users do
  desc "Fetch users from GitHub"
  task populate: :environment do
    user = User.new
    connection = Connection.new
    puts connection.username
    list = connection.user_list(0)
    list.each do |u|
      my_user = GithubUser.new(u)
      my_user.print
    end
  end
end