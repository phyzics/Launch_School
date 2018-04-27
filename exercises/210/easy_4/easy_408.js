// easy_408.js - Digits List
function digitList(number) {
  return String(number).split('').map(Number);
}

console.log(digitList(12345));
console.log(digitList(7));
console.log(digitList(375290));
console.log(digitList(444));
/*
  alg:
    - convert to string
    - split('')
    - map each into a number and return
*/
