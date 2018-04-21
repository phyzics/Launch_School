// date_13.js
var today = new Date();
var nextWeek = new Date(today.getTime());

console.log(today.toDateString() === nextWeek.toDateString());

nextWeek.setDate(nextWeek.getDate() + 7);

console.log(today.toDateString() === nextWeek.toDateString());
