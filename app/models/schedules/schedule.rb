class Schedules::Schedule
  include Mongoid::Document
  store_in collection: 'schedules', database: 'schedules'
  field :day, type: Date
  field :transaction, type: String
  field :field_id, type: Integer
  embeds_many :hours
end
