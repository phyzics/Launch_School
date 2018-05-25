// medium_103.js - Rotation Part 3
/* PEDAC
P:
  - rotate a number while keeping first x digits in place
    - first pass is 0 are kept, then increases by 1 per pass
    - removed digit is pushed to the end of the string
  - leading 0s are dropped

  735291
  352917
  329175
  321759
  321597
  321579

  12345
  23451
  24513
  24135
  24153

  105
  051
  015 -->

E:
  maxRotation(735291);          // 321579
  maxRotation(3);               // 3
  maxRotation(35);              // 53
  maxRotation(105);             // 15 -- the leading zero gets dropped
  maxRotation(8703529146);

DA:
  Data Structure: array of strings

  Alg:
    1) perform the change string.len times
    2) on each pass
      - make sure appropriate number of digits are not passed to function
        - iterator set at str.len, use that for `n` in our call to rotateRightmostDigits
      - return the number
*/
function rotateRightmostDigits(number, n) {
  var digits = String(number).split('');
  var rotatedDigit = digits.splice(-n, 1);
  digits.splice(digits.length, 0, rotatedDigit);
  return Number(digits.join(''));
}

function maxRotation(number) {
  var i;

  for (i = String(number).length; i > 1; i -= 1) {
    number = rotateRightmostDigits(number, i)
  }

  return number;
}

console.log(maxRotation(735291));
console.log(maxRotation(3));
console.log(maxRotation(35));
console.log(maxRotation(105));
console.log(maxRotation(8703529146));
