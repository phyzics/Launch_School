// easy_308.js - Letter Swap
function swap(message) {
  var words = message.split(' ');
  var word;
  var i;

  for (i = 0; i < words.length; i += 1) {
    words[i] = words[i].split('');
    [words[i][0], words[i][words[i].length - 1]] = [words[i][words[i].length - 1], words[i][0]];
    words[i] = words[i].join('');
  }

  return words.join(' ');
}

console.log(swap('Oh what a wonderful day it is'));
console.log(swap('Abcde'));
console.log(swap('a'));
/*
  algorithm:
    - split on ' '
    - iterate over the array of words
      - split each word on ''
      - set [w0, w.l - 1] = [w.l - 1, w0]
      - join on ''
    - join on ' '
*/

// Launch School's answer
function swap(words) {
  var wordsArray = words.split(' ');
  var i;

  for (i = 0; i < wordsArray.length; i += 1) {
    wordsArray[i] = swapFirstLastCharacters(wordsArray[i]);
  }

  return wordsArray.join(' ');
}

function swapFirstLastCharacters(word) {
  if (word.length === 1) {
    return word;
  }

  return word[word.length - 1] + word.slice(1, -1) + word[0];
}
