// string_07.js - Staggered Caps Part 2
function isEven(number) {
  return number % 2 === 0;
}

function staggeredCase(string) {
  var counter = -1;
  return string.split('').map(function (char) {
    if (/[^a-z]/i.test(char)) {
      return char;
    } else {
      counter += 1;
      return isEven(counter) ? char.toUpperCase() : char.toLowerCase();
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));
console.log(staggeredCase('ALL CAPS'));
console.log(staggeredCase('ignore 77 the 444 numbers'));
