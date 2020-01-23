module ClockHelper
  def format_time(time, strftime)
    time&.strftime(strftime)
  end

  def active?(event)
    'table-danger' if event.end_time.nil?
  end
end
