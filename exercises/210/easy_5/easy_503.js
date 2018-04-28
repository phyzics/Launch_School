// easy_503.js - Reverse Number
function reverseNumber(number) {
  return Number(String(number).split('').reverse().join(''));
}

console.log(reverseNumber(12345));
console.log(reverseNumber(12213));
console.log(reverseNumber(456));
console.log(reverseNumber(12000));
console.log(reverseNumber(1));
