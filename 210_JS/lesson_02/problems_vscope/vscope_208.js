// vscope_208.js
var a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};

/*
  guess: outer, inner
  - this is because anonymous functions still can access the global scope, hence
    `a` is the global `a` variable
  - incorrect: the variable declaration of `setScope` is hosited above, and
    so an error is raised when it is called on line 5 since it has yet to be
    assigned to an anonymous function
*/
