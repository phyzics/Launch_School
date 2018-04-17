// unshift.js
function unshift(arr, value) {
  var i;
  var newArray = [value];

  for (i = 0; i < arr.length; i++) {
    newArray[i + 1] = arr[i];
  }

  for (i = 0; i < newArray.length; i++) {
    arr[i] = newArray[i];
  }

  return newArray.length;
}

// Launch School's solution
function unshift(array, value) {
  var i;
  for (i = array.length; i > 0; i -=1) {
    array[i] = array[i - 1];
  }

  array[0] = value;
  return array.length;
}
