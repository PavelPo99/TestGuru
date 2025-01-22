class QuestionsController < ApplicationController
  
  before_action :find_test  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  
  def index
    @questions = @test.questions.all
    render :index
  end

  def show
    @question = @test.questions.find(params[:id])
    render :show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path(@test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    redirect_to test_questions_path(@test), notice: 'Question was successfully deleted.'
  end


  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    redirect_to test_questions_path(@test), alert: 'Question not found.'
  end
end
