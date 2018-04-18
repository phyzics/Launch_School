// slice.js
function slice(arr, start, end) {
  var slicedArr = [];
  var i;
  var j = 0;

  for (i = 0; i < arr.length; i++) {
    if (i >= start && i < end) {
      slicedArr[j] = arr[i];
      j++;
    }
  }

  return slicedArr;
}

// Launch School's answer
function slice(array, begin, end) {
  var newArray = [];
  var i;
  for (i = begin; i < end; i += 1) {
    push(newArray, array[i]);
  }

  return newArray;
}
