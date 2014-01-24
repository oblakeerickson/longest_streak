module ConnectionHelper
  class Connection
    def initialize
      username = get_username
      password = get_password
      @client = Octokit::Client.new :login => username, :password => password
    end
    def username
      @client.login
    end

    def user(username)
      @client.user username
    end

    def rate_limit
      @client.user 'oblakeerickson'
      response = @client.last_response
      @rate_limit = response.headers[:'x-ratelimit-remaining'].to_i
    end

    def user_list(since)
      @list = @client.all_users :since => since
    end

    def last_user(list)
      list.last.id
    end

    private

    def get_username
      LongestStreak1::Application.config.github_username
    end
    def get_password
      LongestStreak1::Application.config.github_password
    end
  end
end