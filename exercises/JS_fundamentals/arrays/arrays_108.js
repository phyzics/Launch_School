// arrays_108.js Array Slice and Splice
function slice(array, begin, end) {
  if (invalidNumberInput(begin) || invalidNumberInput(end)) {
    return 'ERROR: second and third arguments must be integers >= 0!';
  }

  var newArray = [];
  var i;

  if (begin > array.length) begin = array.length;
  if (end > array.length) end = array.length;

  for (i = begin; i < end; i++) {
    newArray.push(array[i]);
  }

  return newArray;
}

function splice(array, start, deleteCount) {
  if (invalidNumberInput(start) || invalidNumberInput(deleteCount)) {
    return 'ERROR: second and third arguments must be integers >= 0!';
  }

  var removedValues = [];
  var args = [];
  var len = array.length;
  var i;
  var j = 0;
  var insertOnly = false;


  if (start > len) start = len;
  if (deleteCount > len - start) deleteCount = len - start;
  if (arguments[3]) args = Array.prototype.slice.call(arguments, 3);
  if (args && deleteCount === 0) {
    insertOnly = true;
  }

  for (i = start; i < len; i++) {
    if (i < start + deleteCount) {
      removedValues.push(array[i]);
    }
  }

  if (insertOnly) {
    for (i = len - 1; i > start - 1; i--) {
      array[i + args.length] = array[i];
    }

    for (i = start; j < args.length; i++) {
      array[i] = args[j];
      j++;
    }
  } else {
    for (i = start; i < len; i++) {
      if (args[j]) {
        array[i] = args[j];
        j++;
      } else {
        if (!args) array[i] = array[i + deleteCount];
      }
    }
  }

  if (!args) array.length -= deleteCount
  return removedValues;
}

function invalidNumberInput(input) {
  if (isNaN(input) || Math.floor(input) !== input || input < 0) {
    return true;
  } else {
    return false;
  }
}

/*
  Though my answer passes the test cases, it fails on examples such as
  arr = [1, 2, 3];
  splice(arr, 1, 2, '3', '4', '5');
  arr;
  => [1, '3', '4'] <--- should be [1, '3', '4', '5']
*/

// Launch School's answers
function splice(array, start, deleteCount) {
  var arrayCopy = slice(array, 0, array.length);
  var itemCount = arguments.length - 3;
  var newLength = array.length + itemCount - deleteCount;
  array.length = newLength;
  var copyBackCount;
  var i;

  for (i = 0; i < itemCount; i += 1) {
    array[start + i] = arguments[3 + i];
  }

  copyBackCount = arrayCopy.length - (start + deleteCount);
  for (i = 0; i < copyBackCount; i += 1) {
    array[start + itemCount + i] = arrayCopy[start + deleteCount + i];
  }

  return slice(arrayCopy, start, start + deleteCount);
}
