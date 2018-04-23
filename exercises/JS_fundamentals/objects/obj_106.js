// obj_106.js - Array Object Part 2
var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

average(myArray);

/*
  No, the user's expectation is incorrect as `10` is logged on line 17, not `5`.
  This is because the `length` property of an array is entirely dependent upon
  the largest array index, which in this case is `1`, hence the length is `2`.
  Thus in the four loop we add 5 + 5 + 5 + 5 which is 20, and then divide
  20 / 2 on line 14 and return that value.
*/

// Further Exploration
function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / Object.keys(array).length;
}
