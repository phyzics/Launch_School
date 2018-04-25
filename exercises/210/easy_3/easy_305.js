// easy_305.js - Palindromic Strings 2
function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

function isRealPalindrome(string) {
  return isPalindrome(string.replace(/[^a-z0-9]/gi, '').toLowerCase());
}
/*
  alg:
    - regex to replace non alpha numerics with ''
    - toLowerCase this new string
*/

// Launch School's solution
function isLetter(char) {
  return char >= 'a' && char <= 'z';
}

function isNumber(char) {
  return char >= '0' && char <= '9';
}

function removeNonLetterNumbers(string) {
  var result = '';
  var i;

  for (i = 0; i < string.length; i += 1) {
    if (isLetter(string[i]) || isNumber(string[i])) {
      result += string[i];
    }
  }

  return result;
}

function isRealPalindrome(string) {
  string = removeNonLetterNumbers(string.toLowerCase());
  return isPalindrome(string);
}
