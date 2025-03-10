class Admin::QuestionsController < Admin::BaseController

  before_action :find_question, only: %i[ show  destroy edit  update ]
  before_action :find_test, only: %i[ create  new index ]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test), notice: 'Question was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test), notice: 'Question was successfully deleted.'
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
    redirect_to admin_tests_path, alert: 'Question not found.'
  end
end
