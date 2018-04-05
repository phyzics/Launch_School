// functions_02.js - Local vs Global Part 2
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

/*
  guess: This is local
  - since the logging takes place within the function, the `myVar` referenced
    is that at the function scoping level
  - correct!
*/
