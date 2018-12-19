db.schedules.find(
  {
    "hours.reservation.status" : "free", 
    "transaction" : "FVMwGVvfXADmMlizHHfHnAJjGAwwDk",
  }
).count();
