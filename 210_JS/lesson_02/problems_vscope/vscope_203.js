// vscope_203.js
var a = 'hello';

for (var i = 0; i < 5; i+= 1) {
  var a = i;
}

console.log(a);

/*
  guess: 5
  - the varible declaration within the `for` essentially acts as reassignment
    for `a` at the global level. It keeps getting incremented until it's value
    is `5`, hence why `5` is logged to the console
  - Incorrect: `i` will be incremented to 5, but once it is the loop ends, thus
    `a` is not assigned to `i` once `i` is 5
*/
