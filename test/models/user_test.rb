require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with active_clock' do
    user = users(:with_active_clock)
    assert user.active_clock.present?
  end

  test 'user with no active_clock' do
    user = users(:without_active_clock)
    assert_nil user.active_clock
  end

  test 'valid user' do
    user = User.new(name: 'Jenny')
    assert user.valid?
  end

  test 'invalid without name' do
    user = User.new(name: '')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end
end
