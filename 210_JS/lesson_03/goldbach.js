// goldbach.js - Goldbach Numbers
function isPrime(number) {
  if (number < 2) {
    return false;
  }

  var root = Math.sqrt(number);

  for (var i = 2; i <= root; i += 1) {
    if (number % i === 0) {
      return false;
    }
  }

  return true;
}

function checkGoldbach(number) {
  if (number % 2 === 1 || number < 4) {
    console.log(null);
    return;
  }

  var i;
  var j;

  for (i = 2; i < number; i += 1) {
    if (i > number / 2) {
      break;
    }

    j = number - i;

    if (isPrime(i) && isPrime(j)) {
      console.log(`${i} ${j}`);
    }

  }
}
