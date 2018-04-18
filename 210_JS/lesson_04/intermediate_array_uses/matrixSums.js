// matrixSums.js
function matrixSums(arr) {
  var reducer = function (accumulator, currentValue) {
    return accumulator + currentValue;
  }
  var sumsArr = [];
  var i;

  for (i = 0; i < arr.length; i++) {
    sumsArr.push(arr[i].reduce(reducer));
  }

  return sumsArr;
}

// Launch School's solution
function matrixSums(arr) {
  var sums = [];
  var currentSum;
  var outerLen;
  var innerLen;
  var i;
  var j;

  for (i = 0, outerLen = arr.length; i < outerLen; i += 1) {
    currentSum = 0;
    for (j = 0, innerLen = arr[i].length; j < innerLen; j += 1) {
      currentSum += arr[i][j];
    }

    sums.push(currentSum);
  }

  return sums;
}
