class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show  destroy edit ]
  before_action :find_test, only: %i[create index new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  
  def index
    @questions = @test.questions.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
    @question
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path(@test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to question_path, notice: 'Question was successfully deleted.'
  end


  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    redirect_to test_questions_path(find_test), alert: 'Question not found.'
  end
end
