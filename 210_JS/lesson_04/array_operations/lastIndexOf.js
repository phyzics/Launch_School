// lastIndexOf.js
function lastIndexOf(arr, value) {
  var currentIndex;
  var i;

  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) currentIndex = i;
  }

  return currentIndex || -1;
}

// Launch School's solution
function lastIndexOf(array, value) {
  var i;
  for (i = array.length - 1; i >= 0; i -= 1) {
    if (array[i] === value) {
      return i;
    }
  }

  return -1;
}
