// string_03.js - Lettercase Counter
function letterCaseCount(string) {
  var counter = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  };
  var characters = string.split('');

  characters.forEach(function (char) {
    if (/[a-z]/.test(char)) {
      counter.lowercase += 1;
    } else if (/[A-Z]/.test(char)) {
      counter.uppercase += 1;
    } else {
      counter.neither += 1;
    }
  });

  return counter;
}

console.log(letterCaseCount('abCdef 123'));
console.log(letterCaseCount('AbCd +Ef'));
console.log(letterCaseCount('123'));
console.log(letterCaseCount(''));

// Launch School's solution
function letterCaseCount(string) {
  var lowerArray = string.match(/[a-z]/g) || [];
  var upperArray = string.match(/[A-Z]/g) || [];
  var neitherArray = string.match(/[^a-z]/gi) || [];

  return {
    lowercase: lowerArray.length,
    uppercase: upperArray.length,
    neither: neitherArray.length,
  };
}
