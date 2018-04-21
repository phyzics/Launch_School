// math_106.js
function random(a, b) {
  var max;
  var min;

  if (a === b) {
    return a;
  } else if (a > b) {
    max = a;
    min = b
  } else {
    max = b;
    min = a;
  }

  return Math.floor(Math.random() * (max - min + 1) + min);
}

// Launch School's answer
function randomInt(min, max) {
  var difference;
  var swap;

  if (min === max) {
    return min;
  } else if (min > max) {
    swap = min;
    min = max;
    max = swap;
  }

  difference = max - min + 1;
  return Math.floor(Math.random() * difference) + min;
}
