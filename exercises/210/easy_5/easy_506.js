// easy_506.js - Counting Up
function sequence(number) {
  var array = [];
  var i;

  for (i = 1; i <= number; i += 1) {
    array.push(i);
  }

  return array;
}

console.log(sequence(5));
console.log(sequence(3));
console.log(sequence(1));
