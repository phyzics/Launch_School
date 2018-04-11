// prime_check.js
function isPrime(number) {
  if (number < 2) {
    return false;
  }

  var root = Math.sqrt(number);

  for (var i = 2; i < root; i += 1) {
    if (root % i === 0) {
      return false;
    }
  }

  return true;
}
