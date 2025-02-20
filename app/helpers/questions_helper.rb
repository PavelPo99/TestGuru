module QuestionsHelper
  
  def question_header(question)
    if question.new_record?
      t('question_helper.create_new_question', question_title: question.test.title )
    else
      t('question_helper.edit_question', question_title: question.test.title )
    end 
  end
end
