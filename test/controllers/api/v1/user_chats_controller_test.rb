require 'test_helper'

class Api::V1::UserChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_user_chats_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_user_chats_update_url
    assert_response :success
  end

end
