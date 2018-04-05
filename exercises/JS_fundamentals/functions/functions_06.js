// functions_06.js - Arguments Part 1
var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

/*
  guess: 7
  - since `b` is assigned to `a`, when we increment `b` by 10, we are not
    reassigning the value of `a` but just the value of `b`
  - correct!
*/
