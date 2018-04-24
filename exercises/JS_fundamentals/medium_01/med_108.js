// med_108.js - Product of Sums
function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  var sum;
  var i;

  for (i = 0, i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}

// the problem is that in the `total()` method, the programmer forgot to use
// the `return` keyword before `sum`, and thus `undefined` will be returned
// instead since there is no explicit return value to the function
// Thus in `productOfSums`, on line 4 `result` is set to `undefined * undefined`
// which evaluates out to `NaN`, and thus `NaN` is returned on line 5

// Further, since sum is not set to 0 on line 9, it is initialized to `undefined`,
// and so when it is incremented, it becomes undefined + numbers[i], which will
// be NaN, and each subsequent addition will also be NaN

// Corrected version
function total(numbers) {
  var sum = 0;
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  return sum;
}
