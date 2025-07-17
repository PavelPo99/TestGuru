class RemoveUniqueIndexFromBadgeUsers < ActiveRecord::Migration[7.2]
  def change
    remove_index :badge_users, name: "index_badge_users_on_user_and_badge"
  end
end
