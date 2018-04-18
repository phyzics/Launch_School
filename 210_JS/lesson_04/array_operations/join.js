// join.js
function join(array, string) {
  var newStr = '';
  var i;

  for (i = 0; i < array.length; i ++) {
    newStr += String(array[i])
    if (i < array.length - 1) newStr += string;
  }

  return newStr;
}
