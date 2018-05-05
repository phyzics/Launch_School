// totalArea.js
function totalArea(array) {
  var areas = array.map(function (element) {
    return element.reduce(function (acc, val) { return acc * val; });
  });

  return areas.reduce(function (acc, val) { return acc + val; });
};

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));
