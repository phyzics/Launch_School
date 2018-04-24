// basics_09.js - Conver a Number to a String
var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
};

function integerToString(num) {
  var string = '';
  var numbers = numberToDigits(num);
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    string += DIGITS[numbers[i]];
  }

  return string;
}

function numberToDigits(num) {
  var digitsArr = [];
  var temp = num;
  var divisors = [1000, 100, 10, 1];
  var i;

  for (i = 0; i < divisors.length; i += 1) {
    digitsArr.push(Math.floor(temp / divisors[i]));
    temp = temp % divisors[i];
  }

  return removeLeadingZeroes(digitsArr);
}

function removeLeadingZeroes(arr) {
  var zeroCount = 0;
  var nonZeroEncountered = false;
  var newArr = [];
  var i;

  for (i = 0; i < arr.length; i += 1) {
    if (arr[i] !== 0) {
      if (!nonZeroEncountered) nonZeroEncountered = true;
      newArr.push(arr[i]);
    } else if (arr[i] === 0 && nonZeroEncountered) {
      newArr.push(arr[i]);
    }
  }

  if (newArr.length === 0) newArr = [0];

  return newArr;
}

/* alg:
  - get digits into an array
    - start at 1000 and go down by power of 10
    - divide and floor - push number
    - set next number to % of previous
  - clean up array
    - if entry is array[0] && equal to 0
      - splice
      - repeat until !== 0
  - iterate over digits
    - concatenate into a string on each pass
*/

// Launch School solution
var DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

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
