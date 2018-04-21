// date_11.js
var today = new Date();
var tomorrow = new Date(today.getTime());

tomorrow.setDate(tomorrow.getDate() + 1);
formattedDate(tomorrow);
