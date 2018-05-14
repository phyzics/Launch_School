// medium_102.js - Rotation Part 2
function rotateRightmostDigits(number, n) {
  var digits = String(number).split('');
  var rotatedDigit = digits.splice(-n, 1);
  digits.splice(digits.length, 0, rotatedDigit);
  return Number(digits.join(''));
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917
/* PEDAC
P:
  - n is the number digit on the right that is rotated to the end
    - the rest of the number 'stays the same', only rotate one digit

  Input:
    - 2 args, numbers: a number, and n digits to rotate
  Output:
    - number which is the argument rotated
E:
  - invalid data type
  - n === 0
  - n > digits in number
  - n is undefined (i.e., missing)
DA:
  Data Structure: array of strings, which are the digits

  Algorithm:
    - convert number to an array of strings
      - coerce number into a string, then split('')
    - move appropriate digit to end of the array
      - splice(-n, 1) and save to a variable
      - splice again at (a.length, 0, variable)
    - convert array back into a number
      - join('')
      - coerce to a number
*/
