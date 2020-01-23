require 'test_helper'

class ClockHelperTest < ActiveSupport::TestCase
  include ClockHelper

  test 'it successfully format time' do
    assert_equal '13:41 PM', format_time(Time.parse('2020-01-22 13:41:20'), '%H:%M %p')
  end

  test 'it successfully toggle active class' do
    clock_event = clock_events(:active_clock)
    assert_equal 'table-danger', toggle_active_class(clock_event)
  end
end
