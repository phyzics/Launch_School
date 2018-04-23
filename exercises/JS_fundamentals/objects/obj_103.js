// obj_103.js - Mutation
var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
var array2 = [];
var i;

for (i = 0; i < array1.length; i += 1) {
  array2.push(array[i]);
}

for (i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

/*
  It should log array2 which has all the same values as array1 originally did
  i.e., capitalized. This is because we pushed the values into array2 as
  opposed to making array2 reference the same object as array1. Hence the
  call to `toUpperCase` in the second for loop won't affect the values in
  array2 even as they mutate array1

  FE:
  1) yes because it is the same object referenced in each array, and objects
    are mutable
  2) do `array2 = array1` instead of pushing the values
*/
