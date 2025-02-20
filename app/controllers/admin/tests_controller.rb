class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[ show edit update destroy ]

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path, notice: t('admin.tests.create.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('admin.tests.update.success')
    else
      render :edit
    end
  end

  def destroy
    @test.questions.each do |question|
      question.answers.destroy_all
    end
    
    @test.test_passages.destroy_all
    @test.destroy

    redirect_to admin_tests_path, notice: t('admin.tests.delete.success')
  end


  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
