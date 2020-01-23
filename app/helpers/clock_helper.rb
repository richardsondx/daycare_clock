module ClockHelper
  def format_time(time, strftime)
    time&.strftime(strftime)
  end

  def toggle_active_class(event)
    'table-danger' if event.end_time.nil?
  end
end
