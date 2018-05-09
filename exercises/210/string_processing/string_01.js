// string_01.js - Uppercase Check
function isUppercase(string) {
  var letters = string.split('');
  var i;

  for (i = 0; i < letters.length; i += 1) {
    if (!letters[i].match(/[a-z]/i)) {
      continue;
    } else if (letters[i] !== letters[i].toUpperCase()) {
      return false;
    }
  }

  return true;
}

console.log(isUppercase('t'));
console.log(isUppercase('T'));
console.log(isUppercase('Four Score'));
console.log(isUppercase('FOUR SCORE'));
console.log(isUppercase('4SCORE!'));
console.log(isUppercase(''));

// Launch School's solution
function isUppercase(string) {
  return !/[a-z]/.test(string);
}
