// vscope_205.js
var a = 'global';

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function superNested() {
      a = 'superNested';
      return a;
    }

    return superNested();
  }

  return nested();
}

console.log(checkScope());
console.log(a);

/*
  guess: superNested, global
  - this is because the reassignment within `superNested()` changes the `a` variable
    declared at the function level within `nested()`. This value is the return
    value of both `superNested()`, `nested()`, and `checkScope()`. The second
    is because we are logging the global variable `a`
  - correct!
*/
