// vscope_101.js
var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/*
  guess: outer, inner, outer
  - this is because when we log on lines 9 and 11, we are accessing the a global
    variable, wheras in `testScope()` we are accessing the inner scope variable
  - correct!
*/
