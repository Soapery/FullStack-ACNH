require "test_helper"

class HomeFurnituresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_furnitures_index_url
    assert_response :success
  end

  test "should get show" do
    get home_furnitures_show_url
    assert_response :success
  end
end
