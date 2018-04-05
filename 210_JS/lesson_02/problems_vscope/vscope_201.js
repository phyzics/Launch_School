// vscope_201.js
function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();

/*
  guess: error
  - since the conditional won't pass, the variable `a` is never declared
  - Incorrect: the variable will be declared but unassigned since scoping is
    function-level, not block-level
*/
