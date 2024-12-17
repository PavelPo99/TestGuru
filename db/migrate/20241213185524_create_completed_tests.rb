class CreateCompletedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false,  foreign_key: { to_table: :tests }
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
