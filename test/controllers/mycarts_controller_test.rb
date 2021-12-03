require 'test_helper'

class MycartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mycarts_show_url
    assert_response :success
  end

end
