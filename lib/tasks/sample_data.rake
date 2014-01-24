namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(github_id: 1, username: "mojombo")
  end
end