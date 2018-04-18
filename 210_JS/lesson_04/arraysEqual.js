// arraysEqual.js
function arraysEqual(arr1, arr2) {
  var i;

  if (arr1.length !== arr2.length) return false;

  for (i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) return false;
  }

  return true;
}
