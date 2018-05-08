// mailCount.js
function formatDate(date) {
  return String(date).split(' ').slice(0, 4).join(' ');
}

function mailCount(emailData) {
  function extractDates(message) {
    var parts = message.split('#/#');
    var date = parts[2].match(/(\d+-)+\d+/)[0];
    return new Date(date);
  }
  
  var messages = emailData.split('##||##');
  var dates = messages.map(extractDates);
  var first;
  var last;

  dates.sort(function (a, b) { return a - b; })
  first = formatDate(dates[0]);
  last = formatDate(dates[dates.length - 1]);

  console.log('Date Range: ' + first + ' - ' + last);
  console.log('Count of Email: ' + messages.length);
}

mailCount(emailData);
