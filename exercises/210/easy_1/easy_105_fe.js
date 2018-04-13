// easy_105.js - Sum or Product of Consecutive Integers Further Exploration (Incomplete)
function computeSum(numbers) {
  var reducer = function (accumulator, currentValue) {
    accumulator + currentValue;
  }

  result = numbers.reduce(reducer);
}

function computeProduct(numbers) {
  var reducer = function (accumulator, currentValue) {
    accumulator * currentValue;
  }
}

var number = prompt('Please enter an array of integers greater than 0:');
var operation;
var result;
var i;

if (number.match(/\./)) {
  console.log('WARNING: All numbers entered should be an integer. Forcing conversion...');
}

number = parseInt(number);

operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.');

if (operation.match(/[s]/i)) {
  computeSum(number);
  console.log(`The sum of the integers between 1 and ${number} is ${result}.`)
} else if (operation.match(/[p]/i)) {
  computeProduct(number);
  console.log(`The product of the integers between 1 and ${number} is ${result}.`)
} else {
  console.log('ERROR: You must enter either "s" or "p" as your operation!');
}
