// medium_106.js - Fibonacci Numbers (Recursion)
/* PEDAC
P:
  - sequence where each number is the sum of the previous two numbers
      F(1) = 1
      F(2) = 1
      F(n) = F(n - 1) + F(n - 2) where n > 2
  - write a recursive function that caluclates the nth fibonnaci number

  1, 1, 2, 3, 5, 8, 13, 21

E:
  console.log(fibonacci(0));
  console.log(fibonacci(1));
  console.log(fibonacci(2));
  console.log(fibonacci(3));
  console.log(fibonacci(4));
  console.log(fibonacci(5));
  console.log(fibonacci(12));
  console.log(fibonacci(20));

DA:
  Data structure: integers

  Algorithm
    - if n is 1 or 2, return 1 (quick guard clause)
    - o/w we return fib(n - 1) + fib(n - 2);
*/

function fibonacci(n) {
  if (n === 1 || n === 2) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

console.log(fibonacci(1));
console.log(fibonacci(2));
console.log(fibonacci(3));
console.log(fibonacci(4));
console.log(fibonacci(5));
console.log(fibonacci(12));
console.log(fibonacci(20));
