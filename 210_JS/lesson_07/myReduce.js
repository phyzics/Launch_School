// myReduce.js
function myReduce(array, func, initial) {
  var acc = arguments.length < 3 ? array[1] : initial;

  array.forEach(function (element) {
    acc = func(acc, element);
  });

  return acc;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));
