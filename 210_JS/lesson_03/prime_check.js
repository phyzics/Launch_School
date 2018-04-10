// prime_check.js
function isPrime(number) {
  if (number === 2 || number === 3) {
    return true;
  } else if (number === 1 || number % 2 === 0 || number % 3 === 0) {
    return false;
  } else {
    return true;
  }
}
