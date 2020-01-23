require 'test_helper'

class ClockEventTest < ActiveSupport::TestCase
  test 'it must validated end_date' do
    clock_event = ClockEvent.new(
      start_time: 2.hours.from_now,
      end_time: 1.hours.from_now
    )
    refute clock_event.valid?, 'must be ater start time'
  end

  test 'it successfully clocks in' do
    option = :clock_in
    user = users(:teacher)
    clock_event = user.clock_events.new
    assert_nil clock_event.start_time
    clock_event.clock_it!(option)

    assert clock_event.start_time
  end

  test 'it successfully clocks out' do
    option = :clock_out
    clock_event = clock_events(:active_clock)
    assert clock_event.start_time
    assert_nil clock_event.end_time
    clock_event.clock_it!(option)

    assert clock_event.start_time
  end

  test 'it successfully clocks in with a reason' do
    option = :clock_in
    reason = 'lunch'
    user = users(:teacher)
    clock_event = user.clock_events.new
    assert_nil clock_event.start_time
    clock_event.clock_it!(option, reason)

    assert clock_event.start_time
    assert_equal 'lunch', clock_event.reason
  end

  test 'total_time_in_hours' do
    clock_event = clock_events(:clock_ended)
    assert_equal 1, clock_event.total_time_in_hours
  end
end
