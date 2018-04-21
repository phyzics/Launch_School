// day_105.js
function dateSuffix(dayOfMonth) {
  var suffix;

  switch (dayOfMonth % 10) {
    case 1:
      suffix = 'st';
      break;
    case 2:
      suffix = 'nd';
      break;
    case 3:
      suffix = 'rd';
      break;
    default:
      suffix = 'th';
  }

  if (dayOfMonth === 11 || dayOfMonth === 12 || dayOfMonth === 13) {
    suffix = 'th';
  }

  return String(dayOfMonth) + suffix;
}

var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var today = new Date();
var day = today.getDay();
var date = today.getDate();

console.log("Today's date is " + String(daysOfWeek[day]) +
            ", the " + dateSuffix(date));

// Launch School's solution
function dateSuffix(date) {
  var suffix = 'th';
  var dateString = String(date);
  var digit;

  if (dateString.length === 1) {
    digit = dateString[0];
  } else if (dateString[0] !== '1') {
    digit = dateString[1];
  }

  if (digit === '1') {
    suffix = 'st';
  } else if (digit === '2') {
    suffix = 'nd';
  } else if (digit === '3') {
    suffix = 'rd';
  }

  return String(date) + suffix;
}
