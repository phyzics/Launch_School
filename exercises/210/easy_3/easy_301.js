// easy_301.js - How Old is Teddy
var min = 20;
var max = 200;
var age = Math.floor(Math.random() * (max - min) + 1 + min);

console.log('Teddy is ' + age + ' years old!');

// Launch School's solution
function randomBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

var age = randomBetween(20, 200);
console.log('Teddy is ' + age + ' years old!');
