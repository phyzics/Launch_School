// medium_105.js - Word to Digit
/*
  A:
    1) convert string into an array (' ')
    2) map over the array
      - if it isn't one of the keywords, return it
      - if it is a keyword, return the appropriate digit

      2a) How to determine keyword
        - have an array of regex starting with /zero/i
        - take current element and replace it with index
          - ele.replace(regexArr[i], Number(i))
    3) join the mapped array and return
*/
function wordToDigit(string) {
  REGEX_ARR = [/\bzero\b/i, /\bone\b/i, /\btwo\b/i, /\bthree\b/i, /\bfour\b/i,
               /\bfive\b/i, /\bsix\b/i, /\bseven\b/i, /\beight\b/i, /\bnine\b/i,
               /\bten\b/i];
  var words = string.split(' ');
  var i;

  return words.map(function (word) {
    for (i = 0; i < REGEX_ARR.length; i += 1) {
      if (REGEX_ARR[i].test(word)) return word.replace(REGEX_ARR[i], Number(i));
    }

    return word;
  }).join(' ');
}


console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
