// substring_02.js - Substring (2)
function substring(string, start, end) {
  var newString = '';
  var i;
  var temp;
  var stringLength = string.length;

  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  if (end === undefined) end = stringLength;

  if (start < 0 || isNaN(start)) start = 0;

  if (end < 0 || isNaN(end)) end = 0;

  if (start > stringLength) start = stringLength

  if (end > stringLength) end = stringLength;

  for (i = 0; i < stringLength; i++) {
    if (i >= start && i < end) {
      newString += string[i];
    }
  }

  return newString;
}


// Launch School solution
function substring(string, start, end) {
  var newString = '';
  var temp;
  var i;

  if (end === undefined) {
    end = string.length;
  }

  if (start < 0 || isNaN(start)) {
    start = 0;
  }

  if (end < 0 || isNaN(end)) {
    end = 0;
  }

  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  if (start > string.length) {
    start = string.length;
  }

  if (end > string.length) {
    end = string.length;
  }

  for (i = start; i < end; i += 1) {
    newString += string[i];
  }

  return newString;
}
