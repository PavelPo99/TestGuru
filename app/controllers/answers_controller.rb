class AnswersController < ApplicationController

  before_action :authenticate_user!, only: %i[ new edit create update destroy ]
  before_action :find_answer, only: %i[ edit show update destroy ]
  before_action :find_question, only: %i[ new create ]


  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @answer.delete
    redirect_to @answer.question
  end


  private 

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
