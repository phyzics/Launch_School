// vscope_206.js
var a = 'outer';
var b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

/*
  guess: outer, outer, outer, inner
  - this is because though we pass `a` as an argument to `setScope()`, the
    parameter `foo` is assigned to `a`, thus when `foo` is reassigned to `'inner'`,
    `a` is not reassigned as well, hence why the third `console.log` logs `outer`.
    `b`, on the other hand, is reassigned to `'inner'`, and thus the fourth
    `console.log` logs `inner`
  - correct!
*/
