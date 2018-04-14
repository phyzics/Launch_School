// easy_109.js - Multiples of 3 and 5
function multisum(number) {
  var sum = 0;
  var i;

  for (i = 3; i <= number; i++) {
    if (i % 3 === 0 || i % 5 === 0) sum += i;
  }

  return sum;
}

/*
  PEDAC
  utp:
    - compute sum of all numbers greater than 1 to n that are multiples of 3 or 5
  data:
    - i/o: numbers
    - data types: numbers
  ec:
    - assume number is integer greater than 1
  alg:
    - initialize a variable, do a for loop from 3 to n
    - if i % 3 || i % 5 === 0; then add to the variable
    - return after the loop is over
*/
