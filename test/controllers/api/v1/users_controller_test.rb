require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_users_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_users_destroy_url
    assert_response :success
  end

  test "should get profile" do
    get api_v1_users_profile_url
    assert_response :success
  end

  test "should get last_login" do
    get api_v1_users_last_login_url
    assert_response :success
  end

end
