// easy_410.js - Array Average
function average(array) {
  return Math.floor(array.reduce(function(acc, val) { return acc + val; }) / array.length);
}

console.log(average([1, 5, 87, 45, 8, 8]));
console.log(average([9, 47, 23, 95, 16, 52]));
