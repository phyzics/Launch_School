// vscope_107.js
console.log(a);

function hello() {
  a = 1;
}

/*
  guess: error
  - this is because even though the funciton definition is hoisted above
    `console.log(a)`, since we never invoke the function, the variable `a` is
    never declaed
  - correct!
*/
