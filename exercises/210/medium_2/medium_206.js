// medium_206.js - Sum Squre - Square Sum
function getNthNumbers(n) {
  var numArr = [];
  var i;

  for (i = 1; i <= n; i += 1) {
    numArr.push(i);
  }

  return numArr;
}

function squareOfSum(nums) {
  var sum = nums.reduce(function (acc, val) { return acc + val; });
  return Math.pow(sum, 2);
}

function sumOfSquares(nums) {
  var squares = nums.map(function (num) { return Math.pow(num, 2); });
  return squares.reduce(function (acc, val) { return acc + val; });
}

function sumSquareDifference(num) {
  var numbers;
  var sumSquared;
  var squaresSummed;

  if (num === 0) return 0;
  numbers = getNthNumbers(num);
  sumSquared = squareOfSum(numbers);
  squaresSummed = sumOfSquares(numbers);

  return sumSquared - squaresSummed;
}

console.log(sumSquareDifference(3));
console.log(sumSquareDifference(10));
console.log(sumSquareDifference(1));
console.log(sumSquareDifference(100));
console.log(sumSquareDifference(0));

// Launch School's Answer
function sumSquareDifference(n) {
  var sum = 0;
  var sumOfSquares = 0;
  var i;

  for (i = 1; i <= n; i += 1) {
    sum += i;
    sumOfSquares += Math.pow(i, 2);
  }

  return Math.pow(sum, 2) - sumOfSquares;
}
