require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get sessions_sign_in_url
    assert_response :success
  end

end
