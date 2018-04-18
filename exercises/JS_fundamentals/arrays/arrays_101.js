// arrays_101.js - Array Copy Part 1
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);
// guess: [1, 2, 3]
// correct!

myArray = [1, 2];
console.log(myOtherArray);
// guess: [1, 2, 3]
// correct!
