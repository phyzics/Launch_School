// medium_101.js - Rotation Part 1
function rotateArray(array) {
  if (!Array.isArray(array)) {
    return undefined;
  } else if (array.length < 2) {
    return array;
  }

  return array.slice(1).concat(array.slice(0, 1));
}

console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined

// the input array is not mutated
var array = [1, 2, 3, 4];
console.log(rotateArray(array));
console.log(array);
/*
Algorithm:
  - correct data type
    - use Array.isArray(arg) and if it's not an array return `undefined`
  - return the argument if size is less than 2
  - concat array.slice(1) with array.slice(0, 1)
*/
