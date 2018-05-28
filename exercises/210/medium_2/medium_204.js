// medium_204.js - Unlucky Days
/* PEDAC
Algorithm:
  - create a new date object (year, 0, 1)
  - create another object date that is one year later
  - have a loop that is valid < next year
    - on each iteration:
      a) if the date is 13 and the day is friday, +1 to counter
        - use getDate and getDay (13 and 5
      b) add one to the day and repeat setDate()
  - return count
*/
function fridayThe13ths(year) {
  var currentDate = new Date(year, 0, 1);
  var endDate = new Date(year + 1, 0, 1);
  var count = 0;

  for (; currentDate < endDate; ) {
    if (currentDate.getDate() === 13 && currentDate.getDay() === 5) count += 1;
    currentDate.setHours(24);
  }

  return count;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2

// Launch School's answer
function fridayThe13ths(year) {
  var thirteenths = [];
  var i;

  for (i = 0; i < 12; i += 1) {
    thirteenths.push(new Date(year, i, 13));
  }

  return thirteenths.reduce(function (count, day) {
    return day.getDay() === 5 ? count += 1 : count;
  }, 0);
}

// It would have been more idiomatic to use filter and then get the length of
// the returned array
