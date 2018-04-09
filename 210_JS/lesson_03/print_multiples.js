// print_multiples.js
function logMultiples(number) {
  if (number % 2 === 0) {
    return;
  }

  for (var i = 99; i >= 1; i -= 2) {
    if (i % number === 0) {
      console.log(i);
    }
  }
}

// Further Exploration

function logMultiples(number) {
  largestMultiple = Math.floor(100 / number) * number;
}
