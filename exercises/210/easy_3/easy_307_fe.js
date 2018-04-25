// easy_307_fe.js - Running Totals Further Exploration
function runningTotal(numbers) {
  var sum = 0;
  return numbers.map(function (n) {
    sum += n;
    return sum;
  });
}

console.log(runningTotal([2, 5, 13]));
console.log(runningTotal([14, 11, 7, 15, 20]));
console.log(runningTotal([3]));
console.log(runningTotal([]));
