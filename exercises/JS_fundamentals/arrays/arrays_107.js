// arrays_107.js - Array Shift and Unshift
function shift(array) {
  if (array.length === 0) return undefined;
  var shiftedElement = array[0];
  var i;

  for (i = 0; i < array.length; i++) {
    array[i] = array[i + 1];
  }

  array.length -= 1;
  return shiftedElement;
}

function unshift(array) {
  var i;
  var initialLength = array.length;
  var totalLength = 0;
  var arrCopy = array.slice();

  for (i = 0; i < arguments.length; i++) {
    if (i === 0) {
      totalLength += arguments[i].length;
    } else {
      totalLength += 1;
    }
  }

  array.length = totalLength;

  for (i = 0; i < initialLength; i++) {
    array[array.length - 1 - i] = arrCopy[arrCopy.length - 1 - i];
  }

  for (i = 1; i < arguments.length; i++) {
    array[i - 1] = arguments[i];
  }

  return array.length;
}

// Launch School's Solutions
function shift(array) {
  var result;

  if (array.length !==0) {
    result = array.splice(0, 1).pop();
  }

  return result;
}

function unshift(array) {
  var i;
  for (i = 1; i < arguments.length; i++) {
    array.splice(i - 1, 0, arguments[i]);
  }

  return array.length;
}
