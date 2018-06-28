// Events01.js - Randomizer
function setTime(max) {
  return (Math.floor(Math.random() * max) + 1) * 1000;
}

function randomizer() {
  var maxSeconds = arguments.length * 2;
  var currentSecond = 1;
  var intervalID = setInterval(function () {
    console.log(currentSecond);
    currentSecond += 1;

    if (currentSecond > maxSeconds) {
      clearInterval(intervalID);
    }
  }, 1000);
  var i;

  for (var i = 0; i < arguments.length; i++) {
    setTimeout(arguments[i], setTime(maxSeconds));
  }
}

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

randomizer(callback1, callback2, callback3);
/*
P:
      - accepts `n` number of callbacks
      - executes the callbacks randomly
        - all callbacks are executed within n * 2 seconds
      - log the seconds

Algorithm:
  1) setting the maximum time
    - use arguments.length * 2 to determine the total amount of seconds
    - set another variable that starts at 1 and increments up
    - set a `setInterval` that goes off ever 1000 ms and logs the value of
      the current second and then increments it
    - if the current second === max, clearInterval
  2) determine the times for the callbacks
    - (Math.floor(Math.random * maxSeconds) + 1) * 1000
*/
