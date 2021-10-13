require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_in" do
    get articles_sign_in_url
    assert_response :success
  end

end
