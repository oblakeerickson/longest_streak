namespace :users do
  desc "Fetch users from GitHub"
  task populate: :environment do
    user = User.new
    connection = ConnectionHelper::Connection.new
    puts connection.username
  end
end