// functions_08.js - Arguments Part 3
var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);

/*
  guess: (3) [1, 2, 3];
  - since JS is pass by value, the original object cannot be modified by the
    function
  - Incorrect: the value is the *reference* to the object, and thus when the
    statement is executed, it is executed on the object, and thus [1,2, 10]
    will be logged
*/
