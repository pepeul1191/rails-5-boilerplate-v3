// for MAX
db.schedules.find(
  { 
    fieldId: { 
      $eq: 1 
    } 
  }
).sort(
  {
    day:-1
  }
).limit(1)

// for MIN
db.schedules.find(
  { 
    fieldId: { 
      $eq: 1 
    } 
  }
).sort(
  {
    day:+1
  }
).limit(1)