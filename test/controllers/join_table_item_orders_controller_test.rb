require 'test_helper'

class JoinTableItemOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get join_table_item_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get join_table_item_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get join_table_item_orders_create_url
    assert_response :success
  end

  test "should get show" do
    get join_table_item_orders_show_url
    assert_response :success
  end

  test "should get edit" do
    get join_table_item_orders_edit_url
    assert_response :success
  end

  test "should get update" do
    get join_table_item_orders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get join_table_item_orders_destroy_url
    assert_response :success
  end

end
