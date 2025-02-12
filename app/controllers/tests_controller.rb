class TestsController < ApplicationController

  before_action :authenticate_user!, only: %i[ new edit update destroy start ]
  before_action :find_test, only: %i[ show edit update destroy start ]

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path, notice: 'Test was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @test.test_passages.destroy_all
    @test.destroy

    redirect_to tests_path, notice: 'Test was successfully deleted.'
  end

  def start    
    set_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
