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
      reservation = Schedules::Reservation.new
      reservation.status = 'free'
      hour = Schedules::Hour.new
      hour.hour = DateTime.new(day.year, day.month, day.day, h)
      hour.reservation = reservation
      hours.push(hour)
    end
    hours
  end

  def self.pipeline_check_calendar_in_range(field_id, date_init, date_end)
    [
      {
        '$match': {
          '$and': [
            {
              'field_id': field_id
            },
            { 'day': {
                '$gte': date_init,
                '$lte': date_end
              }
            },
          ],
        },
      },
      {
        '$group': {
          '_id': "$transaction",
          'count': {
            '$sum': 1
          }
        }
      },
    ]
  end

  def self.pipeline_check_reservations(transaction_id)
    [
      {
        '$match': {
          '$and': [
            {
              'hours.reservation.status': 'reservated'
            },
            {
              'transaction': transaction_id,
            },
          ],
        },
      },
    ]
  end

  def self.pipeline_managment_schedule_list_by_field_id(field_id)
    [
      {
        '$match': {
          'field_id': field_id
        },
      },
      {
        '$group': {
          '_id': '$transaction',
          'days': {
            '$push': {
              'day': '$day',
              'min_hour': {
                '$arrayElemAt': [ '$hours.hour', 0 ]
              },
              'max_hour': {
                '$arrayElemAt': [ '$hours.hour', -1 ]
              },
            }
          },
        }
      },
      {
        '$project': {
          'id': '$transaction',
          'date_init': {
            '$min': '$days.day'
          },
          'date_end': {
            '$max': '$days.day'
          },
          'hours': {
            '$arrayElemAt': [ '$days', 0 ]
          },
        }
      },
      {
        '$project': {
          'id': '$transaction',
          'date_init': {
            '$dateToString': {
              'format': '%d/%m/%Y',
              'date': '$date_init'
            }
          },
          'date_end': {
            '$dateToString': {
              'format': '%d/%m/%Y',
              'date': '$date_end'
            }
          },
          'hour_init': {
            '$hour': '$hours.min_hour'
          },
          'hour_end': {
            '$hour': '$hours.max_hour'
          },
        }
      }
    ]
  end
end
