class AddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :users_id, :integer
    add_column :posts, :users_id, :integer
  end
end
