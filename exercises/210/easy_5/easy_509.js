// easy_509.js - Reverse It Part 1
function reverseSentence(words) {
  return words.split(' ').reverse().join(' ');
}

console.log(reverseSentence(''));
console.log(reverseSentence('Hello World'));
console.log(reverseSentence('Reverse these words'));
