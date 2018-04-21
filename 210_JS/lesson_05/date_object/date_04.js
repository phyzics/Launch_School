// day_104.js
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var today = new Date();
var day = today.getDay();
var date = today.getDate();

console.log("Today's day is " + String(daysOfWeek[day]) +
            ", the " + date + "th");
