// med_105.js - Counter
// Code Snippet 1
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
// Logs "the total value is 15"

// Code Snippet 2
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;
// Logs The total value is NaN

// Code Snippet 3
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
// Logs "The total value is 15"
