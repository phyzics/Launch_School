// lp_04.js - Sum of Sums
function sumOfSums(numbers) {
  var sum = 0;

  numbers.forEach(function (_, idx) {
    sum += numbers.slice(0, idx + 1).reduce (function (acc, val) {
      return acc + val;
    });
  });

  return sum;
}

console.log(sumOfSums([3, 5, 2]));
console.log(sumOfSums([1, 5, 7, 3]));
console.log(sumOfSums([4]));
console.log(sumOfSums([1, 2, 3, 4, 5]));

// Launch School's solution
function sumOfSums(numbers) {
  return numbers.map(function (number, idx) {
    return numbers.slice(0, idx + 1).reduce(function (sum, value) {
      return sum + value;
    });
  }).reduce(function (sum, value) {
    return sum + value;
  });
}
