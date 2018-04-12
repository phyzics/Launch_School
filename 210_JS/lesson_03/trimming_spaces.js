// trimming_spaces.js - Trimming Spaces

function trim(str) {
  function trimLeft(str) {
    var copyMode = false;
    var i;
    var newStr = '';

    for (i = 0; i < str.length; i++) {
      if (str[i] === ' ' && copyMode === false) {
        continue;
      } else {
        copyMode = true;
        newStr += str[i];
      }
    }

    return newStr;
  }

  function trimRight(str) {
    var copyMode = false;
    var i;
    var newStr = '';

    for (i = str.length - 1; i >= 0; i--) {
      if (str[i] === ' ' && copyMode === false) {
        continue;
      } else {
        copyMode = true;
        newStr = str[i] + newStr;
      }
    }

    return newStr;
  }

  var trimmedStr;

  trimmedStr = trimLeft(str);
  trimmedStr = trimRight(trimmedStr);

  return trimmedStr;
}

// Launch School Solution
function trim(string) {
  var trimmed = trimLeft(string);
  trimmed = trimRight(trimmed);

  return trimmed;
}

function trimLeft(string) {
  var newString = ''
  var copyMode = false;
  var i;

  for (i = 0; i < string.length; i += 1 ) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString += string[i];
    }
  }

  return newString;
}

function trimRight(string) {
  var newString = '';
  var copyMode = false;
  var i;

  for (i = string.length - 1; i >= 0; i -= 1) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString = string[i] + newString;
    }
  }

  return newString;
}
