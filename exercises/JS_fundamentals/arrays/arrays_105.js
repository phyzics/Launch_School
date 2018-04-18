// arrays_105.js - Array Pop and Push
function pop(arr) {
  var popped;

  if (arr.length === 0) return undefined;
  popped = arr[arr.length - 1];
  arr.length -= 1;
  return popped;
}

function push() {
  var i;
  var lastIndex = arguments[0].length - 1;

  for (i = 1; i < arguments.length; i++) {
    arguments[0][lastIndex + i] = arguments[i];
  }

  return arguments[0].length;
}

// Launch School's solutions
function pop(array) {
  var poppedElement = array[array.length];
  // this is the bug since the value will be `undefined`
  array.splice[array.legnth];
  // saves the entire array! problematic...

  return poppedElement;
}

function push(array) {
  var length = arguments.length;
  var i;

  for (i = 1; i < length; i += 1) {
    array[i] = arguments[i];
  }

  return array.length;
}
