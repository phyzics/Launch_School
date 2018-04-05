// vscope_204.js
var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo());
console.log(a);

/*
  guess: 4, 3
  - first is the return value of `bar()` which is also the return value of `foo()`,
    second is `a` which is reassigned to `3` within `bar()`
  - correct!
*/
