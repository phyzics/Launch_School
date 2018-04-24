// basics_08.js - Convert a String to a Signed Number
var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function stringToSignedInteger(string) {
  var sum = 0;
  var numbers;
  var sign;
  var offset = 0;
  var i;

  if (string[0].match(/[+-]/)) {
    sign = string[0];
    offset = 1;
  }

  numbers = stringToNumbers(string.slice(offset));

  for (i = 0; i < numbers.length; i += 1) {
    sum = 10 * sum + numbers[i];
  }

  return sign === '-' ? -sum : sum;
}

function stringToNumbers(str) {
  var result = [];
  var i;

  for (i = 0; i < str.length; i += 1) {
    result.push(DIGITS[str[i]]);
  }

  return result;
}

// Launch School's solution
function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default: return stringToInteger(string);
  }
}
