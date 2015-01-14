longest_streak
==============

Who has the Longest Streak on GitHub?

## How to run in Development

- clone this repo
- make sure you have postgresql installed and the database server is running
- create a database.yml file with the follow contents:

  ```yaml
  development:
    adapter: postgresql
    encoding: unicode
    database: longest_streak_development
    host: localhost
    pool: 5
    timeout: 5000
  ```

- run `rake db:create`
- run `rake db:migrate`
- create a .username file with your github username
- create a .password file with your github password
- run `rake users:populate` to start fetching ALL the github users
- run `rake streaks:populate` to start fetching streaks for ALL users
- run `rake new_streaks:populate` to start fetching streaks for new users that don't have streaks in db yet
- run `rake large_streaks:populate` to start fetching streaks for users with streaks greater than 365
