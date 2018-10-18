require 'test_helper'

class EffortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @effort = efforts(:one)
    @user    = users(:user1)

    post login_path, params: {
      session: {
        email: @user.email,
        password: TEST_PASSWORD
      }
    }

  end

  def teardown
    delete logout_path
  end

  test "should get index" do
    get efforts_url
    assert_response :success
  end

  test "should get new" do
    get new_effort_url
    assert_response :success
  end

  test "should create effort" do
    assert_difference('Effort.count') do
      post efforts_url, params: { effort: { description: @effort.description, name: @effort.name } }
    end

    assert_redirected_to effort_url(Effort.last)
  end

  test "should show effort" do
    get effort_url(@effort)
    assert_response :success
  end

  test "should get edit" do
    get edit_effort_url(@effort)
    assert_response :success
  end

  test "should update effort" do
    patch effort_url(@effort), params: { effort: { description: @effort.description, name: @effort.name } }
    assert_redirected_to effort_url(@effort)
  end

  test "should destroy effort" do
    assert_difference('Effort.count', -1) do
      delete effort_url(@effort)
    end

    assert_redirected_to efforts_url
  end
end
