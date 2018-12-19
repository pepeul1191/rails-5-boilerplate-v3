db.schedules.aggregate([
  {
    $match: { 
      $and: [
        { fieldId: 2 },
        { day: { 
            $gte: new ISODate("2018-11-01T05:00:00.000Z"),
            $lte: new ISODate("2018-11-20T05:00:00.000Z") 
          }
        },
      ],
    },
  },
  {
    $count: "dates"
  }
]); 