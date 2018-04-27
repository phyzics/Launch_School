// easy_405.js - Combine Two Lists
function interleave(arr1, arr2) {
  var newArray = [];
  var i;

  for (i = 0; i < arr1.length; i += 1) {
    newArray.push(arr1[i], arr2[i]);
  }

  return newArray;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));
/*
  PEDAC:
  utp:
    - combines two arrays, returns new array that has all elements alternating
    - assume input not empty, same length
  data:
    - i: arrays
    - o: array
  ec:
    - incorrect data type
  alg:
    - iterate over arr1, push from each array into return array
*/
