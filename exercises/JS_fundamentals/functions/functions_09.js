// functions_09.js - Variable Declarations
console.log(a);

var a = 1;

/*
  guess: undefined
  - this is because the variable declaration is hoisted above, but the assignment
    takes place after `a` is logged. If a variable is declared but not assigned,
    it's value is `undefined`
  - correct!
