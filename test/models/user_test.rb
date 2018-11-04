# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(username: 'usr', email: 'usr@xmpl.com', password: 'secret')
    assert user.valid?
  end

  test 'invalid user' do
    user = User.new(
      username: '',
      email: 'usr@exmpl.com',
      password_digest: 'secret'
    )
    refute user.valid?, 'user is valid without username'
    assert_not_nil user.errors[:username]

    user.email = ''
    user.username = 'usr'
    refute user.valid?, 'user is valid without email'
    assert_not_nil user.errors[:email]

    user.email = 'usr@exmpl.com'
    user.password_digest = ''
    refute user.valid?, 'user is valid without password'
    assert_not_nil user.errors[:password]
  end
end
