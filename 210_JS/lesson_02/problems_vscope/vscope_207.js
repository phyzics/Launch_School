// vscope_207.js
var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);

/*
  guess: 50, 60, 15
  - the `increment` parameter shadows the global variable, hence why it only
    increments by 10
  - correct!
*/
