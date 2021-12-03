require 'test_helper'

class ItemPicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get item_pictures_create_url
    assert_response :success
  end

end
