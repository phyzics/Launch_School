// day_108.js
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

function formattedMonth(date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return String(months[date.getMonth()]);
}

function formattedDay(date) {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return String(daysOfWeek[date.getDay()]);
}

function formattedDate(date) {
  var day = formattedDay(date);
  var month = formattedMonth(date);

  console.log("Today's date is " + day + ', ' + month + ' ' + dateSuffix(date.getDate()));
}

var today = new Date();
formattedDate(today);
