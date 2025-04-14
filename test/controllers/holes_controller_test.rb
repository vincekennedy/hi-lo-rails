require "test_helper"

class HolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hole = holes(:one)
  end

  test "should get index" do
    get holes_url
    assert_response :success
  end

  test "should get new" do
    get new_hole_url
    assert_response :success
  end

  test "should show hole" do
    get hole_url(@hole)
    assert_response :success
  end

  test "should get edit" do
    get edit_hole_url(@hole)
    assert_response :success
  end

  test "should destroy hole" do
    assert_difference("Hole.count", -1) do
      delete hole_url(@hole)
    end

    assert_redirected_to holes_url
  end
end
