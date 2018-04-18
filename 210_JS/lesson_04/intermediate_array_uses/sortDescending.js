function compareNumbers(a, b) {
  return a - b;
}

function sortDescending(arr) {
  return arr.slice().sort(compareNumbers).reverse();
}

// Launch School's answer
function sortDescending(arr) {
  var arrCopy = arr.slice();
  return arrCopy.sort(function (a, b) { return b - a});
}
