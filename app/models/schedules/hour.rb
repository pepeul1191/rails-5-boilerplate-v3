class Schedules::Hour
  include Mongoid::Document
  field :hour, type: DateTime
end
