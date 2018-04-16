// findFirst.js
function findFirst(value, arr) {
  var i;
  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) {
      break;
    }
  }

  return arr[i] === value ? i : -1;
}

// without the 'break'
function findFirst(value, arr) {
  var i;

  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) return i;
  }

  return -1;
}
