// easy_310.js
function removeNonLetters(words) {
  var cleanWords = [];
  var i;

  for (i = 0; i < words.length; i += 1) {
    cleanWords[i] = words[i].replace(/[^a-z]/ig, '');
  }

  return cleanWords;
}

function wordSizes(string) {
  var words = string.split(' ');
  var wordCount = {};
  var wordSize;
  var i;

  if (string.length < 1) return wordCount;
  words = removeNonLetters(words);

  for (i = 0; i < words.length; i += 1) {
    wordSize = words[i].length;
    wordCount[wordSize] = wordCount[wordSize] || 0;
    wordCount[wordSize] += 1;
  }

  return wordCount;
}

console.log(wordSizes('Four score and seven.'));
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));
console.log(wordSizes("What's up doc?"));
console.log(wordSizes(''));
