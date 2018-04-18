// combinedArray.js
function combinedArray(even, odd) {
  var newArray = [];
  var i;

  for (i = 0; i < even.length; i++) {
    newArray.push(even[i]);
    newArray.push(odd[i]);
  }

  return newArray;
}
