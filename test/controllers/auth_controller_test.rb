require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  test 'should get login' do
    get login_path
    assert_response :success
  end

  test 'should post authenticate' do
    post authenticate_path(name: 'Danny')
    assert_response :success
  end

  test 'should failed to post authenticate' do
    post authenticate_path(name: '')
    assert_response :redirect
  end
  
  test 'should delete logout' do
    delete logout_path
    assert_response :success
  end
end
