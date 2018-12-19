db.schedules.aggregate([
  {
    $match: {
      field_id: 1
    },
  },
  {
    $group: {
      _id: "$transaction",
      days: {
        $push: {
          day: "$day",
          min_hour: {
            $arrayElemAt: [ "$hours.hour", 0 ]
          },
          max_hour: {
            $arrayElemAt: [ "$hours.hour", -1 ]
          },
        }
      },
    }
  },
  {
    $project: {
      id: "$transaction",
      date_init: {
        $min: "$days.day"
      },
      date_end: {
        $max: "$days.day"
      },
      hours: {
        $arrayElemAt: [ "$days", 0 ]
      },
    }
  },
  {
    $project: {
      id: "$transaction",
      date_init: {
        $dateToString: {
          format: "%d/%m/%Y",
          date: "$date_init"
        }
      },
      date_end: {
        $dateToString: {
          format: "%d/%m/%Y",
          date: "$date_end"
        }
      },
      hour_init: {
        $hour: "$hours.min_hour"
      },
      hour_end: {
        $hour: "$hours.max_hour"
      },
    }
  }
]);
