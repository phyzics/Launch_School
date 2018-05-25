// medium_108.js - Fibonacci (Memoization)
/*
Algorithm:
  1) lookup table
    1: 1
    2: 2
  2) on each call, first look up if n exists in the table
    - if it does, return its value
    - if not, set its value to fib(n), then return it
*/
lookupTable = {};

function fibonacci(n) {
  if (n <= 2) return 1;
  return lookupTable[n] = lookupTable[n] || fibonacci(n - 1) + fibonacci(n - 2);
}

console.log(fibonacci(1));
console.log(fibonacci(2));
console.log(fibonacci(3));
console.log(fibonacci(4));
console.log(fibonacci(5));
console.log(fibonacci(12));
console.log(fibonacci(20));
console.log(fibonacci(50));
console.log(fibonacci(100));
