// vscope_106.js
console.log(a);

var a = 1;

/*
  guess: 1
  - this is because the variable declaration is hoisted above the console.log
  - Incorrect: while the *declaration* is hoisted above, the *assignment* is
    not, thus we log `undefined` to the console
*/
