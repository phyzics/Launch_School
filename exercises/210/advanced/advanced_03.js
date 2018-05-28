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

console.log(transpose([[1, 2, 3, 4]]));            // [[1], [2], [3], [4]]
console.log(transpose([[1], [2], [3], [4]]));      // [[1, 2, 3, 4]]
console.log(transpose([[1]]));                     // [[1]]

console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
