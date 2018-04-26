// easy_308_fe.js - Letter Swap Further Exploration
function swap(words) {
  var wordsArray = words.split(' ');

  wordsArray = wordsArray.map(function (word) {
    if (word.length === 1) return word;

    return word[word.length - 1] + word.slice(1, -1) + word[0];
  });

  return wordsArray.join(' ');
}

console.log(swap('Oh what a wonderful day it is'));
console.log(swap('Abcde'));
console.log(swap('a'));
