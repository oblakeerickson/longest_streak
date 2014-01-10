class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.date :contributed_on
      t.integer :contribution_count
      t.integer :user_id

      t.timestamps
    end
  end
end
