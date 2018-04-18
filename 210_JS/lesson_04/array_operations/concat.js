// concat.js
function concat(arr1, arr2) {
  var concatArray = []
  var i;

  for (i = 0; i < arr1.length; i++) {
    push(concatArray, arr1[i]);
  }

  for (i = 0; i < arr2.length; i++) {
    push(concatArray, arr2[i]);
  }

  return concatArray;
}
