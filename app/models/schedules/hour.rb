class Schedules::Hour
  include Mongoid::Document
  field :hour, type: DateTime
  embeds_one :reservation
end
