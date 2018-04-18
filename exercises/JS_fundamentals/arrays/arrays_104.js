// arrays_104.js - Array Concat Part 2
function concat() {
  var newArray = [];
  var i;
  var j;

  for (i = 0; i < arguments.length; i++){
    if (Array.isArray(arguments[i])) {
      for (j = 0; j < arguments[i].length; j++) {
        newArray.push(arguments[i][j]);
      }
    } else {
      newArray.push(arguments[i]);
    }
  }

  return newArray;
}
