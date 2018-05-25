// medium_107.js - Fibonacci Numbers (Procedural)
/*
1, 1, 2, 3, 5, 8, 13, 21

Algorithm:
  1) if n <= 2, return 1;
  2) set a = 1 and b = 2, c;
  3) loop n - 2 times:
    c = a + b;
    b = c;
    a = b;
  4) return b at the end of loop
*/
function fibonacci(n) {
  if (n <= 2) return 1;
  var fib1 = 1;
  var fib2 = 1;
  var fibSum;
  var i;

  for (i = 0; i < n - 2; i += 1) {
    fibSum = fib1 + fib2;
    fib1 = fib2;
    fib2 = fibSum;
  }

  return fibSum;
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
