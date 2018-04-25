// med_205.js - What's My Value?
var array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length);
// 3
console.log(Object.keys(array).length);
// 4

array[-2] = 'Watermelon';
console.log(array.length);
// 3
console.log(Object.keys(array).length);
// 5

/*
  Only elements are counted by the Array's `length` property, an element being
  a value assigned to an index that is a positive integer. Thus, since `3.4`
  is not an integer, and `-2` is negative, neither of these are valid indexes,
  and thus their values are not elements. Hence the length of the Array remains
  3.

  However, they are still assigned as properties of the Array object, hence why
  they are counted among the keys returned by `Object.keys(array)` (which
  returns an array containing all the keys of the argument). Thus 4 is logged
  to the console on line 7 (since `3.4` is a key whose value is `'Oranges'`),
  and `5` is logged on line 13 (since `-2` is a key whose value is `'Watermelon'`)
*/
