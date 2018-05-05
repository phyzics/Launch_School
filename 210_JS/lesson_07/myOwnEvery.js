// myOwnEvery.js
function myOwnEvery(array, func) {
  array.forEach(function (element) { if (!func(element)) return false; });

  return true;
}

var isAString = function (value) {
  return typeof value == 'string';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));
