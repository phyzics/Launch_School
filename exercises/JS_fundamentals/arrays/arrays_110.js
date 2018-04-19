// arrays_110.js - Array Comparison
function areArraysEqual(array1, array2) {
  if (Array.isArray(array1) === false || Array.isArray(array2) === false ||
      array1.length !== array2.length) {
        return false
      }

  var sortedArray1 = array1.slice().sort();
  var sortedArray2 = array2.slice().sort();
  var i;

  for (i = 0; i < array1.length; i++) {
    if (sortedArray1[i] !== sortedArray2[i]) return false;
  }

  return true;
}

// Launch School's solution
function areArraysEqual(array1, array2) {
  var array2Copy;
  var index;
  var i;

  if (array1.length !== array2.length) {
    return false;
  }

  array2Copy = array2.slice();
  for (i = 0; i < array1.length; i += 1) {
    index = array2Copy.indexOf(array1[i]);
    if (index >= 0) {
      array2Copy.splice(index, 1);
    } else {
      return false;
    }
  }

  return true;
}

/*
  PEDAC
  utp:
    - implement an array comparison so that the position of the values is
      irrelevant
  alg:
    - sort both arrays and compare
      through iteration if all the values are equal
        - make sure to clone the arrays first so as to not mutate the caller
    - if the arrays are differing lengths, return false
    - if either argument is not an array, return false
*/
