// oddElementsOf.js
function oddElementsOf(arr) {
  var newArr = [];
  var i;

  for (i = 1; i < arr.length; i += 2) {
    newArr.push(arr[i]);
  }

  return newArr;
}
