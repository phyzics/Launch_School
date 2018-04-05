// functions_07.js - Arguments Part 2
var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/*
  guess: 7
  - even though `a` is a global variable, since `a` is the parameter of
    the function, the global value is still left alone
  - correct!
*/
