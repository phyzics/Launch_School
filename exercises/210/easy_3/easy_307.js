// easy_307.js - Running Totals
function runningTotal(numbers) {
  var array = [];
  var total = 0;
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    total += numbers[i];
    array.push(total);
  }

  return array;
}

console.log(runningTotal([2, 5, 13]));
console.log(runningTotal([14, 11, 7, 15, 20]));
console.log(runningTotal([3]));
console.log(runningTotal([]));

/*
  PEDAC
  utp:
    - take array of nums, return array with same number of elements
      each ele value being running total\
  data:
    - i: array of numbers
    - o: array of numbers
  ec:
    - invalid data type (non-array and non number)
    - empty array
  alg:
    - set up a running total variable and a newArray variable
    - iterate over the argument
    - rt += arr[i]; newArray.push(rt);
    - return newArray
*/
