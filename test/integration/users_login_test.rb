# frozen_string_literal: true

require 'test_helper'

# Login tests
class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login invalid information' do
    get login_path
    assert_template 'sessions/new'

    post login_path, params: {
      session: {
        email: '',
        password: ''
      }
    }

    assert_template 'sessions/new'
    assert_not flash.empty?
  end
end
