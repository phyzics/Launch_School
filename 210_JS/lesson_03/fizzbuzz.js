// fizzbuzz.js

function fizzbuzz() {
  for (var i = 0; i <= 100; i++) {
    if (i % 15 === 0) {
      console.log('FizzBuzz');
    } else if (i % 5 === 0) {
      console.log('Buzz');
    } else if (i % 3 === 0) {
      console.log('Fizz')
    } else {
      console.log(i);
    }
  }
}

// Further Exploration
function fizzbuzz() {
  for (var i = 1; i <= 100; i += 1) {
    var message = '';

    if (i % 3 === 0) {
      message += 'Fizz';
    } else if (i % 5 === 0) {
      message += 'Buzz';
    }

    console.log(message || i);
  }
}
