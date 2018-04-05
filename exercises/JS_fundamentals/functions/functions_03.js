// functions_03.js - Local vs Global Part 3
var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
  guess: This is local
  - this is because the function has access to the global scope, hence `myVar`
    is reassigned to `'This is local'`
  - correct!
*/
