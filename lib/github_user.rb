class GithubUser

  def initialize(user)
    @id = user.id
    @login = user.login
    #contributions = Contributions.new(@login)
    #@streak = contributions.longest_streak
  end

  def id
    @id
  end

  def login
    @login
  end

  # def streak
  #   @streak
  # end

  def print
    #puts "id: #{id} | login: #{login} | streak: #{streak}"
    puts "id: #{id} | login: #{login}"
  end

  def save
    #DB.run("insert into user (id, login, longest_streak) values('#{id}', '#{login}', '#{streak}')")
  end
end
