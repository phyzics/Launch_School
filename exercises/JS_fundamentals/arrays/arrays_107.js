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
  var j;
  var totalLength = 0;

  for (i = 0; i < arguments.length; i++) {
    totalLength += arguments[i].length;
  }

  array.length = totalLength;

  for (i = 0; i < arguments.length; i++) {
    
  }
}
