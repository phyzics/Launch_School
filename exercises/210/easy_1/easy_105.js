// easy_105.js - Sum or Product of Consecutive Integers
function computeSum(number) {
  result = 0;
  for (i = 1; i <= number; i++) {
    result += i;
  }
}

function computeProduct(number) {
  result = 1;
  for (i = 1; i <= number; i++) {
    result *= i;
  }
}

var number = prompt('Please enter an integer greater than 0:');
var operation;
var result;
var i;

if (number.match(/\./)) {
  console.log('WARNING: The number entered should be an integer. Forcing conversion...');
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
