db.schedules.aggregate([
  {
    $match: {
      $and: [
        {
          "hours.reservation.status" : "free"
        },
        {
          "transaction" : "PAEPGrPDRLfxySJrPIjXApXZQkUQwL",
        },
      ],
    },
  },
]);
