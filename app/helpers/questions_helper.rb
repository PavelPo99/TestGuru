module QuestionsHelper
  
  def question_header
    if @question.new_record?
      title = Test.find(params[:test_id]).title
      header_for_new = "Create New #{title} Question"
      header_for_new 
    elsif @question.persisted?
      title = Test.find(Question.find(params[:id]).test_id).title
      header_for_edit = "Edit #{title} Question"
      header_for_edit
    end 
  end
end
