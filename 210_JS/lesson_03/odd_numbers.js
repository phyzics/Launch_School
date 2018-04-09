// odd_numbers.js
function logOddNumbers(number) {
  for (var i = 1; i <= number; i++) {
    if (i % 2 !== 0) {
      console.log(i);
    }
  }
}

// Further Exploration #1

function logOddNumbers(number) {
  for (var i = 1; ; i += 2) {
    if (i > number) {
      break;
    }
    console.log(i);
  }
}

// Further Exploration #2

function logOddNumbers(number) {
  for (var i = 1; i <= number; i++) {
    if (i % 2 === 0) {
      continue;
    } else {
      console.log(i);
    }
  }
}
