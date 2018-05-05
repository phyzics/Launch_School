// totalSquareArea.js
function totalSquareArea(rectangles) {
  var squares = rectangles.filter(function (rectangle) {
    return rectangle[0] === rectangle[1];
  });

  var areas = squares.map(function (square) {
    return square[0] * square[1];
  }).reduce(function (sum, area) {
    return sum + area;
  });

  return areas;
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));
