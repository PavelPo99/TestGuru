require "test_helper"

class Admin::GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gists_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_gists_show_url
    assert_response :success
  end
end
