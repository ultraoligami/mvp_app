require "test_helper"

class MyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_page_show_url
    assert_response :success
  end
end
