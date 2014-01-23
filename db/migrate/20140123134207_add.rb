class Add < ActiveRecord::Migration
  def change
    add_column :users, :github_id, :integer
    add_index :users, :github_id, unique: true
    add_index :users, :username, unique: true
  end
end
