class AddCorrextTestAndTableNullConstraint < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :level, :integer
    change_column_default :tests, :level, '1'
    change_column_null :tests, :title, false
    change_column_null :tests, :category_id, false

    change_column_null :questions, :body, false
    change_column_null :questions, :test_id, false
    
    change_column_null :users, :name, false
    change_column_null :users, :email, false
  end
end
