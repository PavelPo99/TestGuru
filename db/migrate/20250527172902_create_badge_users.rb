class CreateBadgeUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :badge_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end

    add_index :badge_users, [ :user_id, :badge_id ], unique: true, name: 'index_badge_users_on_user_and_badge'
  end
end
