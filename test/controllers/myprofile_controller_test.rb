require 'test_helper'

class MyprofileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get myprofile_show_url
    assert_response :success
  end

end
