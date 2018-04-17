// shift.js
function shift(arr) {
  var shiftedElement = arr[0];
  var newLength = arr.length - 1;
  var i;

  for (i = 0; i < newLength; i++) {
    arr[i] = arr[i + 1];
  }

  arr.length = newLength;
  return shiftedElement;
}

// Launch School's solution
function shift(array) {
  var first = array[0];
  var i;
  for (i = 0; i < array.length - 1; i += 1) {
    array[i] = array[i + 1];
  }

  array.length = array.length - 1;
  return first;
}
