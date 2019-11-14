require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get session_auth_url
    assert_response :success
  end

end
