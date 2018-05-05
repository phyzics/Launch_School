// myMap.js
function myMap(array, func) {
  var newArray = [];
  var i;

  for (i = 0; i < array.length; i += 1) {
    newArray[i] = func(array[i]);
  }

  return newArray;
}

var plusOne = function (n) { return n + 1; };

console.log(myMap([1, 2, 3, 4], plusOne));
