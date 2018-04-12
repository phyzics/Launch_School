// index_substring.js - Index of Substring
function indexOf(firstString, secondString) {
  var m = firstString.length;
  var n = secondString.length;

  for (var i = 0; i <= m - n; i++) {
    var subStr = '';
    var k = i;

    for (var j = 0; j < n; j++) {
      subStr += firstString[k];
      k++;
    }

    if (subStr === secondString) {
      return i;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  var m = firstString.length;
  var n = secondString.length;

  for (var i = m - n; i >= 0; i--) {
    var subStr = '';
    var k = i;

    for (var j = 0; j < n; j++) {
      subStr += firstString[k];
      k++;
    }

    if (subStr === secondString) {
      return i;
    }
  }

  return -1;
}

/*
  p:
    - first f looks for first instance of a substr in a that matches b and
      returns index of the char where it begins
    - second is the same, just last instance instead of first
    - either return -1 if there's no match
  i/o:
    - i: 2 strings
    - o: number
  ec:

  alg:
    -
*/

// Launch School Solution

function indexOf(firstString, secondString) {
  var limit = firstString.length - secondString.length;
  var matchCount;
  var i;
  var j;

  for (i = 0; i <= limit; i += 1) {
    if (firstString[i + j] === secondString[j]) {
      matchCount += 1;
    } else {
      break;
    }
  }

  if (matchCount === secondString.length) {
    return i;
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  var limit = firstString.length - secondString.length;
  var matchCount;
  var i;
  var j;

  for (i = limit; i >= 0; i -= 1) {
    matchCount = 0;

    for (j = 0; j < secondString.length; j += 1) {
      if (firstString[i + j] === secondString[j]) {
        matchCount += 1;
      } else {
        break;
      }
    }

    if (matchCount === secondString.length) {
      return i;
    }
  }

  return -1;
}
