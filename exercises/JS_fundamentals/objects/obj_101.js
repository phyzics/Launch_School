// obj_101.js - Literal
var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a];
myObject.a;

/*
  the bug is found on line 10; a must be as a string within brackets, otherwise
  it thinks we are looking for a variable `a` of which one doesn't exist
*/
