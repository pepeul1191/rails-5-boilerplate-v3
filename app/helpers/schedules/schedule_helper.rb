module Schedules::ScheduleHelper
  def self.create(day, field_id, hour_init, hour_end, transaction)
    n = Schedules::Schedule.new
    n.day = day
    n.hours = generate_hours(day, hour_init, hour_end)
    n.transaction = transaction
    n.field_id = field_id
    n
  end

  def self.generate_hours(day, hour_init, hour_end)
    hours = []
    (hour_init..hour_end).each do |h|
      hour = Schedules::Hour.new
      hour.hour = DateTime.new(day.year, day.month, day.day, h)
      hours.push(hour)
    end
    hours
  end
end
