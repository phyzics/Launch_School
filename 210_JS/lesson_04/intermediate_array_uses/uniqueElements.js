// uniqueElements.js
function uniqueElements(arr) {
  var uniqueArr = [];
  var i;
  var j;
  var duplicate = false;

  for (i = 0; i < arr.length; i++) {
    duplicate = false;

    for (j = 0; j < uniqueArr.length; j++) {
      if (arr[i] === uniqueArr[j]) duplicate = true;
    }

    if (!duplicate) uniqueArr.push(arr[i]);
  }

  return uniqueArr;
}

// Launch School's solution
function uniqueElements(arr) {
  var uniques = [];
  var len = arr.length;
  var i;

  for (i = 0; i < len; i += 1) {
    if (uniques.indexOf(arr[i]) === -1) {
      uniques.push(arr[i]);
    }
  }

  return uniques;
}
