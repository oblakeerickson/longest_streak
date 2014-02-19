class AddLongestStreakToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longest_streak, :integer
    add_index :users, :longest_streak
  end
end
