class Schedules::Reservation
  include Mongoid::Document
  store_in collection: 'reservations', database: 'schedules'
  field :status, type: String
  field :transaction_id, type: Integer
  field :player_id, type: Integer
end
