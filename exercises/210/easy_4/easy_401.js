// easy_401.js - Cute Angles
function parseAfterDecimal(number) {
  var digits;
  var decimalIndex = String(number).indexOf('.');

  return digits = Number(String(number).slice(decimalIndex));
}

function addLeadingZeroes(number) {
  return number < 10 ? '0' + String(number) : String(number);
}

function dms(angle) {
  var degrees = parseInt(angle);
  var minutes;
  var seconds;

  if (String(angle) === degrees) return degrees + '°00\'00"';

  minutes = parseAfterDecimal(angle) * 60;
  seconds = parseAfterDecimal(minutes) * 60;
  minutes = parseInt(minutes) === 360 ? 0 : parseInt(minutes);
  seconds = parseInt(seconds) === 360 ? 0 : parseInt(seconds);

  return addLeadingZeroes(degrees) + '°' + addLeadingZeroes(minutes) + '\'' + addLeadingZeroes(seconds) + '"'
}

console.log(dms(30));
console.log(dms(76.73));
console.log(dms(254.6));
console.log(dms(93.034773));
console.log(dms(0));
console.log(dms(360));
/*
  PEDAC
  utp:
    - take fp num b/w 0 to 360 deg., return string in deg., min., sec.
    - 60 mins in a deg
    - 60 s in min
  data:
    - i: number
    - o: string
  ec:
    - incorrect data type
    - negative number
  alg:
    - deg parseInt
    - String(angle).indexOf('.')
      - if not -1, split from that value to end of string
        - convert this to a number as minutes
    - minutes *= 60;
    - repeat process for seconds;
    - return string
*/

// Launch School's solution
var DEGREE = '\xB0';
var MINUTES_PER_DEGREE = 60;
var SECONDS_PER_DEGREE = 3600;

function dms(degreesFloat) {
  var degreesInt = Math.floor(degreesFloat);
  var minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
  var seconds = Math.floor(
    (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
    SECONDS_PER_DEGREE
  );
  return String(degreesInt) + DEGREE + padZeroes(minutes) + "'" +
                                       padZeroes(seconds) + '"';
}

function padZeroes(number) {
  var numString = String(number);
  return numString.length < 2 ? ('0' + numString) : numString;
}
