require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    user = users(:with_active_clock)
    post authenticate_path(name: user.name)
    get user_path(id: user.id)
    assert_response :success
  end

  test 'should redirect non loggeg in users' do
    user = users(:with_active_clock)
    get user_path(id: user.id)
    assert_response :redirect
  end
end
