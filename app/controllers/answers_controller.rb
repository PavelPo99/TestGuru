class AnswersController < ApplicationController
  def index
    @answers = Question.find(params[:question_id])
  end
end
