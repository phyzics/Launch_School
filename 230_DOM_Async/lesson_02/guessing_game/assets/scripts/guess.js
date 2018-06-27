document.addEventListener('DOMContentLoaded', function () {
  function newGame() {
    answer = Math.floor(Math.random() * 100) + 1;
    paragraph.textContent = 'Guess a number from 1 to 100';
    guesses = 0;
    guessBox.disabled = false;
  }

  function isInvalidInteger(input) {
    return /[^0-9]/g.test(String(input)) || input > 100 || input < 1;
  }

  var form = document.querySelector('form');
  var input = document.getElementById('guess');
  var link = document.querySelector('a');
  var paragraph = document.querySelector('p');
  var guessBox = document.querySelector('input[type="submit"]');
  var answer;
  var guesses;


  form.addEventListener('submit', function (event) {
    event.preventDefault();
    var guess = parseInt(input.value, 10);
    var message;

    guesses += 1;

    if (isInvalidInteger(guess)) {
      message = 'Input must be a positive integer between 1 and 100.'
    } else if (guess > answer) {
      message = 'My number is lower than ' + String(guess);
    } else if (guess < answer) {
      message = 'My number is higher than ' + String(guess);
    } else {
      message = 'You guessed it! It took you ' + String(guesses) + ' guesses.';
      guessBox.disabled = true;
    }

    paragraph.textContent = message;

  });

  link.addEventListener('click', function (event) {
    newGame();
  });

  newGame();
});
