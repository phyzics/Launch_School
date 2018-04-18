// splice.js
function splice(array, begin, number) {
  var i;
  var j = 0;
  var subArray = [];

  for (i = begin; j < number; i++) {
    push(subArray, array[i]);
    j++;
  }

  for (i = 0; i < array.length; i++) {
    if (i >= begin) {
      array[i] = array[i + number];
    }
  }

  array.length -= number;
  return subArray;
}

// Launch School's answer
function splice(array, begin, number) {
  var removedValues = [];
  var i;
  for (i = begin; i < array.length; i += 1) {
    if (i < begin + number) {
      push(removedValues, array[i]);
    }

    array[i] = array[i + number];
  }

  array.length = array.length - number;
  return removedValues;
}
