// easy_309.js - Letter Counter Part 1
function wordSizes(string) {
  var words = string.split(' ');
  var wordCount = {};
  var wordSize;
  var i;

  if (string.length < 1) return wordCount;

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

/*
  PEDAC
  utp:
    - function that takes string of 1+ words, returns object that shows
      "size": number
  data:
    - i: string
    - o: object with numbers as values
  ec:
    - incorrect data type
    - empty string (empty object)
    - punctuation (counted as part of word)
  alg:
    - split string into array of words
    - have an object
    - iterate over array
      - for each word
        - if key, then increment
        - else create key and set to 1
    - return object
*/
