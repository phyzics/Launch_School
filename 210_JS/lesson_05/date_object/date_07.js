// day_107.js
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
var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
var today = new Date();
var day = today.getDay();
var date = today.getDate();
var month = today.getMonth();

console.log("Today's date is " + String(daysOfWeek[day]) +
            ', ' + String(months[month]) + ' ' + dateSuffix(date));
