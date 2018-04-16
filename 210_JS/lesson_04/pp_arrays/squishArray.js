// squishArray
function squishArray(arr) {
  var i;
  var string = '';

  for (i = 0; i < arr.length; i++) {
    string += String(arr[i]);
  }

  return string;
}
