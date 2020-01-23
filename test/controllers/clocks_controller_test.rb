require 'test_helper'

class ClocksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:with_active_clock)
  end

  test 'should initialize put touch_clock' do
    post authenticate_path(name: @user.name)
    put user_touch_clock_path(user_id: @user.id, option: 'clock_in')
    assert_response :success
  end

  test 'should redirect put touch_clock with bad option' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    put user_touch_clock_path(user_id: @user.id, clock_id: clock_event.id, option: 'bad_option')
    assert_response :redirect
  end

  test 'should put touch_clock with clock_in option' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    put user_touch_clock_path(user_id: @user.id, clock_id: clock_event.id, option: 'clock_in')
    assert_response :success
  end

  test 'should put touch_clock with clock_out option' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    put user_touch_clock_path(user_id: @user.id, clock_id: clock_event.id, option: 'clock_out')
    assert_response :success
  end

  test 'should get edit' do
    post authenticate_path(name: @user.name)
    get edit_user_clock_path(user_id: @user.id, id: @user.clock_events.first)
    assert_response :success
  end

  test 'should put update' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    put user_clock_update_path(
      user_id: @user.id,
      clock_id: clock_event.id,
      clock_event: {
        start_time: clock_event.start_time,
        end_time: clock_event.end_time,
      }
    )
    assert_response :success
  end


  test 'should fail put update' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    put user_clock_update_path(
      user_id: @user.id,
      clock_id: 99999,
      clock_event: {
        start_time: clock_event.start_time,
        end_time: clock_event.end_time,
      }
    )
    assert_response :success
  end

  test 'should delete delete' do
    post authenticate_path(name: @user.name)
    clock_event = @user.clock_events.first
    delete user_clock_delete_path(user_id: @user.id, clock_id: clock_event.id)
    assert_response :success
  end
end
