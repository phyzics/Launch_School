// partialFuncApp.js - Partial Function Application
// 1)
function greet(string1, string2) {
  console.log(string1[0].toUpperCase() + string1.slice(1) + ', ' + string2 + '!');
}

// 2
function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  }
}

var sayHello = partial(greet, 'hello');
var sayHi = partial(greet, 'hi');

sayHello('Brandon');
sayHi('Sarah');
