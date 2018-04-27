// easy_407.js - Multiply Lists
function multiplyList(arr1, arr2) {
  var newArr = [];
  var i;

  for (i = 0; i < arr1.length; i += 1) {
    newArr.push(arr1[i] * arr2[i]);
  }

  return newArr;
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));
