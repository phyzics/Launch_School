// medium_205.js - Next Featured Number Higher than a Given Value
/* PEDAC
P:
  - number has to be a multiple of 7
  - must be odd
  - no digits can repeat
  - cannot be 11 digits long or more
E:
  featured(12);           // 21
  featured(20);           // 21
  featured(21);           // 35
  featured(997);          // 1029
  featured(1029);         // 1043
  featured(999999);       // 1023547
  featured(999999987);    // 1023456987
  featured(9999999999);  // "error: number too large, no next featured number"
  featured(0);            // 7
  featured(1);            // 7

DA:
  Data Structure: numbers
  Algorithm:
    a) determine if number is odd
      - method that checks that % 2 != 0
    b) determine that number is a multiple of 7
      - method that checks that % 7 === 0
    c) check if number has no repeated digits
      - convert to string
      - use a method to check if digits are all unique
        - push each value to a different array if it doesn't exit
        - if the length of the arrays are the same, return true, else false
    d) loop from number until either a) next valid number, or b) too large
      - return error once number is 10000000000
*/
function isOdd(n) {
  return n % 2 !== 0;
}

function isMultipleOf7(n) {
  return n % 7 === 0;
}

function hasUniqueDigits(n) {
  var digits = String(n).split('');
  var uniqueDigits = [];

  digits.forEach(function (digit) {
    if (uniqueDigits.indexOf(digit) === -1) {
      uniqueDigits.push(digit)
    }
  });

  return digits.length === uniqueDigits.length;
}

function featured(num) {
  num += 1;
  while (num < 10000000000) {
    if (isOdd(num) && isMultipleOf7(num) && hasUniqueDigits(num)) {
      return num;
    }

    num += 1;
  }

  return 'Error: Number is too large. There is no next featured number!';
}

console.log(featured(12));
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9999999999));  // "error: number too large, no next featured number"
console.log(featured(0));            // 7
console.log(featured(1));            // 7


// Launch School's answer
function featured(number) {
  var MAX_FEATURED = 9876543201;
  var featuredNum = toOddMultipleOf7(number);

  do {
    if(allUnique(featuredNum) && featuredNum < number) {
      return featuredNum;
    }

    featuredNum += 14;
  } while (featuredNum < MAX_FEATURED);

  return 'There is no possible number that fulfills those requirements.';
}

function toOddMultipleOf7(number) {
  while (number % 2 === 0 || number % 7 !== 0) {
    number += 1;
  }

  return number;
}

function allUnique(number) {
  var digits = String(number).split('');
  var seen = {};
  var i;

  for (i = 0; i < digits.length; i += 1) {
    if (seen[digits[i]]) {
      return false;
    } else {
      seen[digits[i]] = true;
    }
  }

  return true;
}
