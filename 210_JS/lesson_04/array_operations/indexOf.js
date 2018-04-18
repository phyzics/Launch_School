// indexOf.js
function indexOf(arr, value) {
  var i;

  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) return i;
  }

  return -1;
}
