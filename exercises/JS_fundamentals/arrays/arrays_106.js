// arrays_106.js - Array and String Reverse
function reverse(inputforReversal) {
  var newStr = '';
  var newArr = [];
  var len = inputforReversal.length;
  var i;

  for (i = len - 1; i >= 0; i--) {
    if (Array.isArray(inputforReversal)) {
      newArr.push(inputforReversal[i]);
    } else {
      newStr += inputforReversal[i];
    }
  }

  return newStr || newArr;
}

// Launch School's Solutions
function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArray(inputForReversal);
  } else {
    return reverseString(inputForReversal);
  }
}

function reverseArray(inputForReversal) {
  var reversed = [];
  var length = inputForReversal.length;
  var i;

  for (i = 0; i < length; i += 1) {
    reversed[length - i] = inputForReversal[i];
    // the problem is here: when i = 0 the index of the new arr is the same
    // as the length, making it too big
  }

  return reversed;
}

function reverseString(inputForReversal) {
  var stringArray = inputForReversal.split(' ');
  return reverseArray(stringArray).join(' ');
}
