// octalToDecimal.js
function octalToDecimal(numberString) {
  var numbers = numberString.split('').map(function (number) {
    return Number(number);
  }).reverse();

  return numbers.map(function (number, i) {
    return number * Math.pow(8, i);
  }).reduce(function (acc, val) {
    return acc + val;
  });
}

console.log(octalToDecimal('1'));
console.log(octalToDecimal('10'));
console.log(octalToDecimal('130'));
console.log(octalToDecimal('17'));
console.log(octalToDecimal('2047'));
console.log(octalToDecimal('011'));
