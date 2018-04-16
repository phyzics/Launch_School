// reverse.js
function reverse(arr) {
  var i;
  var lastIndex = arr.length - 1;
  var newArr = [];

  for (i = lastIndex; i >= 0; i--) {
    newArr[lastIndex - i] = arr[i];
  }

  return newArr;
}
