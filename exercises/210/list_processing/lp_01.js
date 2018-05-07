// lp_01.js - Sum of Digits
function sum(number) {
  var digits = String(number).split('').map(function (digit) {
    return Number(digit);
  });

  return digits.reduce(function (acc, val) { return acc + val; });
}

console.log(sum(23));
console.log(sum(496));
console.log(sum(123456789));

// Launch School's answer
function sum(number) {
  return String(number).split('').map(function (numString) {
    return parseInt(numString, 10);
  }).reduce(function (total, num) {
    return total + num;
  });
}
