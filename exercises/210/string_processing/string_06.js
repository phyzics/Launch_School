// string_06.js - Staggered Caps Part 1
function isEven(number) {
  return number % 2 === 0;
}

function staggeredCase(string) {
  var counter = -1;
  return string.split('').map(function (char) {
    if (/[^a-z]/i.test(char)) {
      counter += 1;
      return char;
    } else {
      counter += 1;
      return isEven(counter) ? char.toUpperCase() : char.toLowerCase();
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));
console.log(staggeredCase('ALL_CAPS'));
console.log(staggeredCase('ignore 77 the 444 numbers'));

// Launch School's Solution
function staggeredCase(string) {
  return string.split('').map(function (char, index) {
    if (index % 2 === 0) {
      return char.toUpperCase();
    } else {
      return char.toLowerCase();
    }
  }).join('');
}
