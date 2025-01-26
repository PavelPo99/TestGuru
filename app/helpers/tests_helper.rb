module TestsHelper

  def test_header
    if @test.new_record?
      header_for_new = "Create New Test"
      header_for_new 
    elsif @test.persisted?
      title = Test.find(params[:id]).title
      header_for_edit = "Edit #{title} Test"
      header_for_edit
    end 
  end
end
