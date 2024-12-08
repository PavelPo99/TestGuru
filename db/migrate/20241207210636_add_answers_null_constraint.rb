class AddAnswersNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
    change_column_default(:answers, :correct, false)
  end
end
