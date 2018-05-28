// advanced_104.js - Rotating Matrices
/* PEDAC
P :
  1  5  8
  4  7  2
  3  9  6

  3  4  1
  9  7  5
  6  2  8

  - take a matrix, and rotate each side by 90 degrees to the right
    - top is right, right is bottom, etc
    - essentially, next matrix will have n rows, where n is the length of each
      row
    - elements with the same index and shifted into the same indexed row
      i.e., 1, 4, 3 are all shifted into row 0 since they have index 0

E:
  - data types
  - single row
  - no rows

Algorithm:
  a) set up the next matrix
    - number of rows is determined by length of each row
    - use a loop to push in the appropriate number of empty subarrays
  b) move elements into the new matrix
    - iterate over the matrix
      - iterate over each row
        - if idx === i then shift the element into the subarray
*/
function constructMatrix(len) {
  var newMatrix = [];
  var i;

  for (i = 0; i < len; i += 1) {
    newMatrix.push([]);
  }

  return newMatrix;
}

function rotate90(matrix) {
  var rowLength = matrix[0].length;
  var rotatedMatrix = constructMatrix(rowLength);
  var i;

  matrix.forEach(function (row) {
    row.forEach(function (element, idx) {
      rotatedMatrix[idx].unshift(element);
    });
  });

  return rotatedMatrix;
}


var matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

var matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

var matrix3 = [
  [1, 2, 3],
];

var newMatrix1 = rotate90(matrix1);
var newMatrix2 = rotate90(matrix2);
var newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));
var newMatrix4 = rotate90(matrix3);

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]
console.log(newMatrix4);      // [[1], [2], [3]]
