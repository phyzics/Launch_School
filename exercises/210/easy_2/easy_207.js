// easy_207.js - Double Doubles
function twice(number) {
  return isDoubleDouble(number) ? number : number * 2;
}

function isDoubleDouble(number) {
  var n = String(number);
  var firstHalf;
  var secondHalf;

  if (n.length % 2 === 0) {
    firstHalf = buildSubString(0, n.length / 2, n);
    secondHalf = buildSubString(n.length / 2, n.length, n);
    return firstHalf === secondHalf;
  } else {
    return false;
  }
}

function buildSubString(start, end, string) {
  var i;
  var subString = '';

  for (i = start; i < end; i++) {
    subString += string[i];
  }

  return subString;
}

// Launch School solution
function twice(number) {
  if (isDoubleNumber(number)) {
    return number;
  } else {
    return number * 2;
  }
}

function isDoubleNumber(number) {
  var stringNumber = String(number);
  var center = stringNumber.length / 2;
  var leftNumber = stringNumber.substring(0, center);
  var rightNumber = stringNumber.substring(center);

  return leftNumber === rightNumber;
}


/*
  PEDAC
  utp:
    - even number whose leftside digits == right side digits
    - return double double, otherwise return * 2
  data:
    - i/o: numbers
    - data: numbers, strings
  ec:
    - improper data type
    - floating point
    - 0 and negative
  alg:
    - return double if number is odd
    - check if dd
      - convert to string
      - if the length is even
        - if not, return doubled
      - build two strings by iterating to half, and from half
        - compare the two in a ternary
*/
