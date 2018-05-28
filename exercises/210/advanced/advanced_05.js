// advanced_05.js - Merge Sorted Lists
/*
Algorithm:
  - set up a sorted array
  - set up a double loop with arr1 being outer, arr2 being inner
    - if the current element of arr2 is less than the current element of arr1
      then it is pushed in; otherwise it is skipped over
        - another variable will track the max index of elements in arr 2 that
          have been pushed
            thus on subsequent iterations, if elements <= to this then we skip
    - the element of arr1 is always pushed in at the end
  - if arr2 isnt empty, push the remaining elements of it in
    - elements needed to be pushed in = length of ra - arr1
    - then subtract length of arr2 - prev sub = elements left to be pushed in
    - loop from arr2.length - that number
  ([1, 5, 9], [2, 6, 8]);
  ([2, 6, 8], [1, 5, 9]);
*/

function merge(arr1, arr2) {
  var sortedArray = [];
  var maxIndex = -1;
  var arr1len = arr1.length;
  var arr2len = arr2.length;
  var elementsLeft;
  var i;
  var j;


  for (i = 0; i < arr1len; i += 1) {
    for (j = 0; j < arr2len; j += 1) {
      if (j <= maxIndex) continue;

      if (arr2[j] < arr1[i]) {
        sortedArray.push(arr2[j]);
        maxIndex = j;
      }
    }

    sortedArray.push(arr1[i]);
  }

  if (sortedArray.length !== arr1len + arr2len) {
    elementsLeft = arr2len - (sortedArray.length - arr1len);

    for (i = arr2len - elementsLeft; i < arr2len; i += 1) {
      sortedArray.push(arr2[i]);
    }
  }

  return sortedArray;
}

console.log(merge([1, 5, 9], [2, 6, 8]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([2, 6, 8], [1, 5, 9]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 1, 3], [2, 2]));         // [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5]

// Launch School's Solution
function merge(array1, array2) {
  var copy1 = array1.slice();
  var copy2 = array2.slice();
  var result = [];

  while (copy1.length > 0 && copy2.length > 0) {
    result.push(copy1[0] >= copy2[0] ? copy1[0].shift() : copy2[0].shift());
  }

  return result.concat(copy1.length === 0 ? copy2 : copy1);
}
