// easy_204.js - Fibonacci Number Location by Length
function fibonacci(number) {
  if (number <= 2) return 1;

  return fibonacci(number - 1) + fibonacci(number - 2);
}


function findFibonacciIndexByLength(digits) {
  var currentFibNumber;
  var i = 1;

  while(digits) {
    currentFibNumber = fibonacci(i);

    if (String(currentFibNumber).length === digits) {
      return i;
    } else {
      i++;
    }
  }
}

// Launch School
function findFibonacciIndexByLength(length) {
  var first = 1;
  var second = 1;
  var index = 2;
  var fibonacci;

  do {
    fibonacci = first + second;
    index += 1;
    first = second;
    second = fibonacci;
  } while (String(fibonacci).length < length);

  return index;
}

/*
  PEDAC
  utp:
    - take a number, and return the first number in the fibonnaci sequence
      that has that the number of digits as specified by the argument
  data:
    - i/o: number
  ec:
    - assume arg is integer greater than or equal to 2
  alg:
    - have a fibonacci helper function
      - return '1' if the argument is '2' or less
      - otherwise, recurse (fib(n-1) + fib(n-2)
    - if the return value of the fib function is equal to the digits, return
      the number, o/w recurse by incrementing by 1
*/
