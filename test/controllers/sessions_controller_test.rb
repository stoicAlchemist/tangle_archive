require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user1)

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

  test "should get new" do

    get login_path
    assert_response :success

    assert_select 'h1', 'Sign In'
    assert_select 'label', 'Email'
    assert_select 'input[id=session_email]'
    assert_select 'label', 'Password'
    assert_select 'input[id=session_password]'
    assert_select 'input[type=submit][value="Log In"]'

  end

  test "should create session" do
    post login_path, params: {
      session: {
        email: @user.email,
        password: TEST_PASSWORD
      }
    }

    assert_redirected_to root_path
    assert_equal @user.id, session[:user_id]
  end

  test "should not create a session" do
    post login_path, params: {
      session: {
        email: @user.email,
        password: 'bad password'
      }
    }

    assert_select 'div.alert', /^Invalid User\/Password combination/
  end

end
