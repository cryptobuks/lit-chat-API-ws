require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_destroy_url
    assert_response :success
  end

  test "should get profile" do
    get users_profile_url
    assert_response :success
  end

  test "should get last_login" do
    get users_last_login_url
    assert_response :success
  end

end
