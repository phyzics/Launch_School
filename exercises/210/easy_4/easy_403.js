// easy_403.js - Halvsies
function halvsies(array) {
  var firstHalf = [];
  var secondHalf = [];
  var midpoint = Math.floor(array.length / 2);

  if (array.length % 2 === 0) {
    firstHalf = array.slice(0, midpoint);
    secondHalf = array.slice(midpoint);
  } else {
    firstHalf = array.slice(0, midpoint + 1);
    secondHalf = array.slice(midpoint + 1);
  }

  return [firstHalf, secondHalf];
}

console.log(halvsies([1, 2, 3, 4]));
console.log(halvsies([1, 5, 2, 4, 3]));
console.log(halvsies([5]));
console.log(halvsies([]));

// Launch School's solution
function halvsies(array) {
  var half = Math.ceil(array.length / 2);
  var firstHalf = array.slice(0, half);
  var secondHalf = array.slice(half);

  return [firstHalf, secondHalf];
}
