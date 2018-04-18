// mirroredArray.js
function mirroredArray(arr) {
  var duplicateArr = arr.slice(0);

  duplicateArr.reverse();
  return arr.concat(duplicateArr);
}

// Launch School's solution
function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}
