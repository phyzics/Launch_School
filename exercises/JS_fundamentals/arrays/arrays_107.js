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
