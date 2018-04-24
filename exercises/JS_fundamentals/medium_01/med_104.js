// med_104.js - Selected Columns
function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) {
    for (var j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

/*
    1) the second loop uses the length property of `cols` for the value of
       `length`, which is ending the loop prematurely
       - yes, but *why* is it ending the loop prematurely? because the length
         used in the outer loop is now smaller since length is just reassigned
         because a) blocks do not create scopes in JS, and b) hoisting means
         that this is just reassignment
*/

// Corrected version
function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, lengthOuter = numbers.length; i < lengthOuter; i += 1) {
    for (var j = 0, lengthInner = cols.length; j < lengthInner; j += 1) {
      if (!result[]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}
