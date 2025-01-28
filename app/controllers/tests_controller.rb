class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def edit;  end

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
    @test.destroy

    redirect_to tests_path, notice: 'Test was successfully deleted.'
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
