// lp_03.js - Multiply All Pairs
function multiplyAllPairs(arr1, arr2) {
  var products = [];

  arr1.forEach(function (arr1num) {
    arr2.forEach(function (arr2num) {
      products.push(arr1num * arr2num);
    });
  });

  return products.sort(function (a, b) { return a - b; });
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));
