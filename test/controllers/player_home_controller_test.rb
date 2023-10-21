require "test_helper"

class PlayerHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_home_index_url
    assert_response :success
  end

  test "should get show" do
    get player_home_show_url
    assert_response :success
  end
end
