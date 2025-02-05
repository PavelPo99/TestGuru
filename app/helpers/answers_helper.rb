module AnswersHelper

  def answer_header(answer)
    if answer.new_record?
     "Create New Answer"
    else
      "Edit #{answer.body} Answer"
    end 
  end
end
