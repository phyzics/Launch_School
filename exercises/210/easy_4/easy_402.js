// easy_402.js - combinding Arrays
function union(arr1, arr2) {
  var unionArr = [];
  var i;

  for (i = 0; i < arr1.length; i += 1) {
    if (unionArr.indexOf(arr1[i]) === -1) unionArr.push(arr1[i]);
  }

  for (i = 0; i < arr2.length; i += 1) {
    if (unionArr.indexOf(arr2[i]) === -1) unionArr.push(arr2[i]);
  }

  return unionArr;
}

console.log(union([1, 3, 5], [3, 6, 9]));

// Launch School solutions
function copyNonDupsTo(resultArray, array) {
  array.forEach(function (value) {
                  if (resultArray.indexOf(value) === -1) {
                    resultArray.push(value);
                  }
                });
}

function union(array1, array2) {
  var newArray = [];
  copyNonDupsTo(newArray, array1);
  copyNonDupsTo(newArray, array2);
  return newArray;
}

function union() {
  var newArray = [];
  var i;

  for (i = 0; i < arguments.length; i += 1) {
    copyNonDupsTo(newarray, arguments[i]);
  }

  return newArray;
}
