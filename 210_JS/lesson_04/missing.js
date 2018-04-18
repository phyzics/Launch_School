// missing.js
function missing(arr) {
  var missingNums = [];
  var i;

  for (i = arr[0]; i < arr[arr.length - 1]; i++) {
    if (arr.indexOf(i) === -1) missingNums.push(i);
  }

  return missingNums;
}

// Launch School's solution
function missing(arr) {
  var result = [];
  var start = array[0] + 1;
  var end = array[array.length - 1];
  var integer;

  for (integer = start; integer < end; integer += 1) {
    if (array.indexOf(integer) < 0) {
      result.push(integer);
    }
  }

  return result;
}
