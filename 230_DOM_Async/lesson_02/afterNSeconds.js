function afterNSeconds(callback, seconds) {
  var duration =  seconds * 1000;

  setTimeout(callback, duration);
}

afterNSeconds(function () {
  console.log('5 seconds!');
}, 5);
