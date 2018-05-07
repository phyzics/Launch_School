// lp_05.js - Leading Substrings
function substringsAtStart(string) {
  var letters = string.split('');

  return letters.map(function (_, idx) {
    return string.slice(0, idx + 1);
  });
}

console.log(substringsAtStart('abc'));
console.log(substringsAtStart('a'));
console.log(substringsAtStart('xyzzy'));

// Launch School's answer
function substringAtStart(string) {
  return string.split('').map(function (char, idx, stringArray) {
    return stringArray.slice(0, idx + 1).join('');
  });
}
