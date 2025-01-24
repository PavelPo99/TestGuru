module QuestionsHelper
  def question_header
    if params[:action] == 'new'
      title = Test.find(params[:test_id]).title
      header_for_new = "Create New #{title} Question"
      header_for_new 

    else
      title = Test.find(Question.find(params[:id]).test_id).title
      header_for_edit = "Edit #{title} Question"
      header_for_edit
    end 
  end
end
