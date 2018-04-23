// obj_110.js - After Midnight Part 2
var MINUTES_PER_HOUR = 60;
var HOURS_PER_DAY = 24;
var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

function afterMidnight(timeStr) {
  var time = new Date('1/1/2000 ' + timeStr);
  var hours = time.getHours();
  var minutes = time.getMinutes();

  return hours * MINUTES_PER_HOUR + minutes;
}

function beforeMidnight(timeStr) {
  var deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }

  return deltaMinutes;
}

// Launch School's solution
var MILLISECONDS_PER_MINUTE = 60000;
var DATE_PART = '1/1/2000';

function afterMidnight(timeStr) {
  var midnight = new Date(DATE_PART + ' 00:00');
  var currentDateTime  = new Date(DATE_PART + ' ' + timeStr);

  return (currentDateTime.getTime() - midnight.getTime()) / MILLISECONDS_PER_MINUTE;
}
