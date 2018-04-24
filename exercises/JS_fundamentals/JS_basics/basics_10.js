// basics_10.js - Convert a Signed Number to a String
function integerToString(number) {
  var result = '';
  var remainder;

  do {
    remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0);

  return result;
}

function signedIntegerToString(number) {
  if (number < 0) {
    return '-' + integerToString(-number);
  } else if (number > 0) {
    return '+' + integerToString(number);
  } else {
    return integerToString(number);
  }
}
