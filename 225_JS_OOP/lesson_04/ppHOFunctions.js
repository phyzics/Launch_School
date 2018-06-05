// ppHOFunctions.js - Practice Problems: Higher-Order ppHOFunctions
/*
1)  they either a) accept a function as an argument and/or b) return a function

2) `filter` because it takes `checkEven` as an argument
*/
// 3
var numbers = [1, 2, 3, 4];

function makeCheckEven() {
  return function(num) {
    return num % 2 === 0;
  }
}

var checkEven = makeCheckEven();

numbers.filter(checkEven); // return [2, 4]

// 4
function execute(func, operand) {
  return func.call(this, operand);
  // return func(operand);
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"

// 5
function makeListTransformer(func) {
  return function(collection) {
    return collection.map(func);
  }
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

timesTwo([1, 2, 3, 4]); // [2, 4, 6, 8]
