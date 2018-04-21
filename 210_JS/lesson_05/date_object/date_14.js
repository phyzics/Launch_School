// date_14.js
function formatTime(date) {
  var hours = String(date.getHours());
  var minutes = String(date.getMinutes());

  if (hours.length < 2) hours = '0' + hours;
  if (minutes.length < 2) minutes = '0' + minutes;

  return hours + ':' + minutes;
}

// Launch School's answer
function formatTime(date) {
  return addZero(date.getHours()) + ':' + addZero(date.getMinutes());
}

function addZero(value) {
  var timeComponent = String(value);
  return timeComponent.length < 2 ? '0' + timeComponent : timeComponent;
}
