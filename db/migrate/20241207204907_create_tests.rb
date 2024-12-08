class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, limit: 30
      t.integer :category_id

      t.timestamps
    end
  end
end
