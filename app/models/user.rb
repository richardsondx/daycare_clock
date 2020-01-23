class User < ApplicationRecord
  has_many :clock_events
  validates_presence_of :name

  def active_clock
    clocks = clock_events.where(end_time: nil)
    return clocks.last unless clocks.empty?

    nil
  end
end
