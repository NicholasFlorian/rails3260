require 'test_helper'

class DiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dy = dies(:one)
  end

  test "should get index" do
    get dies_url
    assert_response :success
  end

  test "should get new" do
    get new_dy_url
    assert_response :success
  end

  test "should create dy" do
    assert_difference('Die.count') do
      post dies_url, params: { dy: { colour: @dy.colour, fk_user_id: @dy.fk_user_id, sides: @dy.sides } }
    end

    assert_redirected_to dy_url(Die.last)
  end

  test "should show dy" do
    get dy_url(@dy)
    assert_response :success
  end

  test "should get edit" do
    get edit_dy_url(@dy)
    assert_response :success
  end

  test "should update dy" do
    patch dy_url(@dy), params: { dy: { colour: @dy.colour, fk_user_id: @dy.fk_user_id, sides: @dy.sides } }
    assert_redirected_to dy_url(@dy)
  end

  test "should destroy dy" do
    assert_difference('Die.count', -1) do
      delete dy_url(@dy)
    end

    assert_redirected_to dies_url
  end
end
