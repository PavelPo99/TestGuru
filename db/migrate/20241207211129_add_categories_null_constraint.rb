class AddCategoriesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :title, false)
    change_column_default(:categories, :level, '1')
  end
end
