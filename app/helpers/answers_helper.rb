module AnswersHelper

  def answer_header(answer)
    if answer.new_record?
      t('answers_helper.create_new_answer')
    else
      t('answers_helper.edit_answer', body: answer.body )
    end 
  end
end
