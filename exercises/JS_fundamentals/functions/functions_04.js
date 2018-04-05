// functions_04.js - Variable Lookup
var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/*
  guess: This is global
  - this is because functions have access to the global scope, and it is the
    global `myVar` variable that is logged within `someFunction()`
  - correct!
*/
