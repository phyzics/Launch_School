// functions_01.js - Local vs Global Part 1
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
  guess: This is global
  - since we declar `myVar` within `someFunction()` it is a function scoped
    variable, hence there is no reassignment of the global level `myVar` within
    the function
  - correct!
*/
