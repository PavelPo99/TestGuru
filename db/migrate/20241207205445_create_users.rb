class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 20, null: false
      t.string :email, limit: 40, null: false

      t.timestamps
    end
  end
end
