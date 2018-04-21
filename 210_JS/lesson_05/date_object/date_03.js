// date_103.js
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var today = new Date();
var day = today.getDay();

console.log("Today's day is " + String(daysOfWeek[day]));
