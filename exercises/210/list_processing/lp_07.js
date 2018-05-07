// lp_07.js
function substrings(string) {
  var strings = [];
  var letters = string.split('');
  var currentSelection;

  letters.forEach(function (letter1, idx1) {
    currentSelection = letters.slice(idx1);

    currentSelection.forEach(function (letter2, idx2) {
      strings.push(currentSelection.slice(0, idx2 + 1).join(''));
    });
  });

  return strings;
}

function reversedString(string) {
  return string.split('').reverse().join('');
}

function isPalindrome(string) {
  return (string.length > 1) && string === reversedString(string);
}

function palindromes(strings) {
  return substrings(strings).filter(isPalindrome);
}

console.log(palindromes('abcd'));
console.log(palindromes('madam'));
console.log(palindromes('hello-madam-did-madam-goodbye'));
console.log(palindromes('knitting cassettes'));
