// substring_01.js - Substring (1)
function substr(string, start, length) {
  var strLength = string.length;
  var i;
  var copyMode = false;
  var charsCopied = 0;
  var newStr = '';

  if (start < 0) start = strLength + start;
  if (length <= 0) return '';

  for (i = 0; i < strLength; i++) {

    if (i === start) copyMode = true;

    if (copyMode) {
      newStr += string[i];
      charsCopied ++;
    }

    if (charsCopied === length) return newStr;
  }

  return newStr;
}

/*
  alg:
    - if +
      - dont build string until `i` == `start`
        - have a counter that breaks the loop after `length`
    - if -
      - set `i` to `strLength - start`
    - return string
*/

// Launch School solution
function substr(string, start, length) {
  var newString = '';
  var index;
  var i;

  if (start < 0) {
    start = string.length + start;
  }

  for (i = 0; i < length; i += 1) {
    index = start + i;

    if (string[index] === undefined) {
      break;
    }

    newString += string[index];
  }

  return newString;
}
