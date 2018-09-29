require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid user" do
    user = User.new(username: 'usr', email: 'usr@xmpl.com', password_digest: 'secret')
    assert user.valid?
  end

  test "invalid without username" do
    user = User.new(username: '', email: 'usr@exmpl.com', password_digest: 'secret')
    refute user.valid?, 'user is valid without username'
    assert_not_nil user.errors[:username]
  end

  test "invalid without email" do
    user = User.new(username: 'usr', email: '', password_digest: 'secret')
    refute user.valid?,  'user is valid without email'
    assert_not_nil user.errors[:email]
  end

  test "invalid without password" do
    user = User.new(username: 'usr', email: 'usr@exmpl.com', password_digest: '')
    refute user.valid?, 'user is valid without password'
    assert_not_nil user.errors[:password]
  end

end
