// advanced_02.js - Transpose 3x3
/* Algorithm
  a) set up return array
    - use the length of a nested array
    - loop that many arrays into another array
  b) push correct elements into the return array
    - initialize an interator
    - loop over the collection 3 times
      - loop over each subarray
        - if the idx of the element == i, push it into returnarr[i]
*/
function createMatrix(len) {
  var newMatrix = [];
  var i;

  for (i = 0; i < len; i += 1) {
    newMatrix.push([]);
  }

  return newMatrix;
}

function transpose(matrix) {
  var rowLength = matrix[0].length;
  var returnMatrix = createMatrix(rowLength);
  var i;

  for (i = 0; i < rowLength; i += 1) {
    matrix.forEach(function (row) {
      row.forEach(function (element, idx) {
        if (i === idx) returnMatrix[i].push(element);
      });
    });
  }

  return returnMatrix;
}

var matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

var newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
