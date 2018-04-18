// arrays_103.js - Array Concat Part 1
function concat(array1, secondArgument) {
  var newArray = [];
  var i;

  for (i = 0; i < array1.length; i++) {
    newArray.push(array1[i]);
  }

  if (Array.isArray(secondArgument)) {
    for (i = 0; i < secondArgument.length; i ++) {
      newArray.push(secondArgument[i]);
    }
  } else {
    newArray.push(secondArgument);
  }

  return newArray;
}
