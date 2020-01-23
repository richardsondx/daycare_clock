require 'test_helper'

class ClocksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:with_active_clock)
  end

  # test 'sould get new' do
  #   post authenticate_path(name: @user.name)
  #   get new_user_clock_path(user_id: @user.id)
  #   assert_response :success
  # end

  # test 'should put touch_clock' do
  #   put user_touch_clock_path(user_id: @user.id)
  #   assert_response :success
  # end

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
      clock_id: clock_event,
      clock_event: {
        start_time: clock_event.start_time,
        end_time: clock_event.end_time,
      }
    )
    assert_response :success
  end

  # test 'should delete delete' do
  #   delete user_clock_delete_path(user_id: @user.id)
  #   assert_response :success
  # end
end
