// pop.js
function pop(arr) {
  var poppedElement = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return poppedElement;
}

// Launch School's solution
function pop(array) {
  var newLength = array.length - 1;
  var value = array[newLength];
  array.length = newLength;
  return value;
}
