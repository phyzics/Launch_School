// easy_510.js - Reverse It Part 2
function reverseWords(string) {
  var words = string.split(' ');

  return words.map(function (word) {
    return word.length >= 5 ? word.split('').reverse().join('') : word;
  }).join(' ');
}

console.log(reverseWords('Professional'));
console.log(reverseWords('Walk around the block'));
console.log(reverseWords('Launch School'));
/*
  Algorithm:
    - split string on ' '
    - iterate over each word
      - if length > 5
        - split on ''
        - reverse, join '', and push
      - else push
    - join newArr' '
*/
