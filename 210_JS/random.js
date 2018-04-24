// gcd.js - Greatest Common Divisor
function gcd(a, b) {
  var larger;
  var smaller;
  var quotient;
  var remainder;

  function getLargerAndSmaller(a, b) {
    if (a > b) {
      larger = a;
      smaller = b;
    } else {
      larger = b;
      smaller = a;
    }
  }

  getLargerAndSmaller(a, b);

  while (quotient !== 0) {
    remainder = Math.floor(larger / smaller);
    quotient = larger % smaller;

    larger = smaller;
    smaller = quotient;
  }

  return remainder;
}

console.log(gcd(48, 18));
