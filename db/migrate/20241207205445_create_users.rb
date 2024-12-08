class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 20
      t.string :email, limit: 40

      t.timestamps
    end
  end
end
