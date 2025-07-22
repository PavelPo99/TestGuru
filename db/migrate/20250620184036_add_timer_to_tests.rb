class AddTimerToTests < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :timer, :integer, null: true
  end
end
