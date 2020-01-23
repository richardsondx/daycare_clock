module ClockHelper
  def format_time(time, strftime)
    time.strftime(strftime) if time
  end

  def is_active?(event)
    if event.end_time.nil?
      'table-danger'
    end
  end
end
