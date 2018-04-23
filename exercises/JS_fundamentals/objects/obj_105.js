// obj_105.js - Array Object Part 1
var myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]);
console.log(myArray['e']);
console.log(myArray);

/*
logs:
  "a"
  undefined
  "d"
  5
  ["a", "b", "c", "f", "-1": "d", e: 5]

  while we can set properties in an Array, only the properties which are an
  integer >= 0 are considered elements of the array, hence the value logged
  on line 13
*/
