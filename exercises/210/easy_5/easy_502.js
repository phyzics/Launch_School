// easy_502.js - Double Char Part 2
function doubleConsonants(string) {
  return string.replace(/((?![eiou])[b-z])/ig, '$1$1');
}

console.log(doubleConsonants('String'));
console.log(doubleConsonants('Hello-World!'));
console.log(doubleConsonants('July 4th'));
console.log(doubleConsonants(''));
