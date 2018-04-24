// basics_07.js - Convert a String to a Number
var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function stringToInteger(string) {
  var sum = 0;
  var currentDigit;
  var i;

  for (i = 0; i < string.length; i += 1) {
    currentDigit = DIGITS[string[i]];
    sum += currentDigit * Math.pow(10, string.length - 1 - i);
  }

  return sum;
}

//  alg:
//    - iterate through the string front to back
//      - use the DIGITS object to get the correct digit
//      - multiply this by 10^length - i
//      - then add this to a sum variable
//      - return sum

// Launch School's solution
function stringToInteger(string) {
  var value = 0;
  var numbers = stringToNumbers(string);
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    value = 10 * value + numbers[i];
  }

  return value;
}

function stringToNumbers(string) {
  var result = [];
  var i;

  for (i = 0; i < string.length; i += 1) {
    result.push(DIGITS[string[i]]);
  }

  return result;
}
