# frozen_string_literal: true

require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
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
end
