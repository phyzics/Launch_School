// nthElementOf.js
function nthElementOf(arr, index) {
  return arr[index];
}

var digits = [4, 8, 15, 16, 23, 42];

nthElementOf(digits, 3);
// returns 16
nthElementOf(digits, 8);
// undefined
nthelementOf(digits, -1);
// undefined
