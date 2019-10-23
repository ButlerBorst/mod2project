require 'test_helper'

class ChefControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chef_index_url
    assert_response :success
  end

  test "should get show" do
    get chef_show_url
    assert_response :success
  end

  test "should get new" do
    get chef_new_url
    assert_response :success
  end

  test "should get create" do
    get chef_create_url
    assert_response :success
  end

  test "should get edit" do
    get chef_edit_url
    assert_response :success
  end

  test "should get update" do
    get chef_update_url
    assert_response :success
  end

  test "should get delete" do
    get chef_delete_url
    assert_response :success
  end

end
