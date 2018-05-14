// luhnFormula.js
function isValidLuhnFormula(string) {
  function luhnFormula (number, idx) {
    var doubled;

    if(idx % 2 === 0) return number;

    doubled = number * 2;
    return doubled >= 10 ? doubled - 9 : doubled;
  }

  var cleaned = string.replace(/\D/g, '');
  var digits;
  var sum;

  if (cleaned.length === 0) return false;

  digits = cleaned.split('').map(Number).reverse().map(luhnFormula);
  sum = digits.reduce(function (acc, val) { return acc + val; });
  return sum % 10 === 0;
}

console.log(isValidLuhnFormula('1111'));  // false
console.log(isValidLuhnFormula('8763'));  // true
console.log(isValidLuhnFormula(''));  // false
console.log(isValidLuhnFormula('abcde'));  // false
console.log(isValidLuhnFormula('8fb7  6.3--'));  // true
console.log(isValidLuhnFormula('2323 2005 7766 3554'));  // true
/*
P:
  - lunh formula, starting from rightmost digit, doubles every second digit
    - if doubled digit is >= 10, -9 from it
  - sum the digits, and % 10
    - if 0, valid, o/w invalid
  Input: String of numbers (ignore non-numbers)
  Output: boolean
E:
  - can I assume it'll always be a string?
  - empty string
  - string with no numbers
  - string with numbers mixed with non-numbers

DA:
  Data type: array of numbers
  Algorithm:
  - clean the string
    - replace() using a regex
    - if length is 0, return false
  - convert to an array of numbers
    - split('')
    - map(Number)
    - reverse()
  - double every second digit
    - map(function (ele, i)) if i is odd, perform doubling (-9)
  - sum the numbers and % 10
    - reduce, and then % 10
*/
