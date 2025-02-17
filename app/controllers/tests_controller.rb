class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def start   
    authenticate_user! 
    
    current_user.tests.push(find_test)
    redirect_to current_user.test_passage(find_test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
