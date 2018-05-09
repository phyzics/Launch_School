// string_05.js - Swap Case
function swapcase(string) {
  var characters = string.split('');

  return characters.map(function (char) {
    if (/[a-z]/.test(char)) {
      return char.toUpperCase();
    } else if (/[A-Z]/.test(char)) {
      return char.toLowerCase();
    } else {
      return char;
    }
  }).join('');
}

console.log(swapcase('CamelCase'));
console.log(swapcase('Tongiht on XYZ-TV'));
