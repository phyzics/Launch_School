// vscope_102.js
var a = 'outer'

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/*
  guess: outer, inner, inner
  - this is because inside `testScope()` we are reassigning the global variable
    `a` to the string `'inner'`
  - correct!
