class ClockEvent < ApplicationRecord
  belongs_to :user
  validate :end_must_be_after_start

  def end_must_be_after_start
    return true if end_time.nil?

    if start_time >= end_time
      errors.add(:end_time, 'must be ater start time')
    end
  end

  def clock_it!(option)
    # Time.zone = ActiveSupport::TimeZone.new(timezone)

    case option
    when :clock_in
      self.start_time = Time.now.in_time_zone(Rails.application.config.time_zone)
      save
    when :clock_out
      self.end_time = Time.now.in_time_zone(Rails.application.config.time_zone)
      save
    end
  end

  def total_time_in_hours
    if start_time.present? && end_time.present?
      (end_time - start_time ) / 1.hours
    end
  end
end
