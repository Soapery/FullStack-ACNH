require "test_helper"

class PlayerHomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get player_homes_index_url
    assert_response :success
  end

  test "should get show" do
    get player_homes_show_url
    assert_response :success
  end
end
