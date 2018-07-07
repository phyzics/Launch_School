$(function () {
  // Helper Functions
  function getLetterIndexes(char) {
    var indexes = [];
    var i;

    for (i = 0; i < game.currentWord.length; i += 1) {
      if (game.currentWord[i] === char) {
        indexes.push(i);
      }
    }

    return indexes;
  }

  function disableGameplay() {
    $(document).off('keypress');
    $('#message + p a').text('Play another');
  }

  function setResults(win) {
    var $message = $('#message');

    disableGameplay();
    
    if (win) {
      $(document.body).addClass('win');
      $message.text('You win!');
    } else {
      $(document.body).addClass('lose');
      $message.text("Sorry! You're out of guesses");
    }
  }

  function setVictoryStatus() {
    if (game.wrongGuesses === game.maxWrongAllowed) {
      setResults(false);
    }

    if ($('#spaces span').text() === game.currentWord) {
      setResults(true);
    }
  }

  function isValidKey(keyCode) {
    return keyCode >= 97 && keyCode <= 122;
  }

  function addGuess(key) {
    game.lettersGuessed.push(key);
    $('#guesses').append('<span>' + key + '</span>');
  }

  function correctGuess(key) {
    var indexes = getLetterIndexes(key);
    $('#spaces span').each(function (i, span) {
      if (indexes.includes(i)) {
        $(span).text(key);
      }
    });
  }

  function incorrectGuess(key) {
    game.wrongGuesses += 1;
    $('#apples').removeClass().addClass('guess_' + Number(game.wrongGuesses));
  }

  function doesWordHaveKey (key) {
    return game.currentWord.indexOf(key) !== -1;
  }

  function isNewGuess(key) {
    return !game.lettersGuessed.includes(key);
  }

  function guessWord(e) {
    var keyCode = e.which;
    var key;

    if (isValidKey(keyCode)) {
      key = String.fromCharCode(keyCode);

      if (isNewGuess(key)) {
        addGuess(key);

        doesWordHaveKey(key) ? correctGuess(key) : incorrectGuess(key);
      }

      setVictoryStatus();
    }
  }

  function newGameSetup() {
    $(document.body).removeClass();
    $('#apples').removeClass();
    $('p a').text('');
    $('#message').text('');
    $('#guesses span').remove();
    $(document).on('keypress', guessWord);
  }

  function startNewGame() {
    game.newGame();

    if (game.currentWord !== undefined) newGameSetup();
  }

  // Game Object and Protected Data
  var randomWord = function () {
    var words = ['apple', 'banana', 'orange', 'pear'];

    return function () {
      var index = Math.floor(Math.random() * words.length);
      var word = words.splice(index, 1)[0];

      return word;
    };
  }();

  var game = function () {
    var Game = {
      getWord: function () {
        return randomWord();
      },

      newGame: function () {
        this.currentWord = this.getWord();

        if (this.currentWord === undefined) {
          this.outOfWords();
        } else {
          this.wrongGuesses = 0;
          this.lettersGuessed = [];
          this.maxWrongAllowed = 6;
          this.createBlanks();
        }

        return this;
      },

      outOfWords: function () {
        $('#message').text("Sorry, I've run out of words!");
        $('p a').text('');
      },

      createBlanks: function () {
        var $spaces = $('#spaces');
        var i;
        var numberOfBlanks = this.currentWord.length;

        $spaces.find('span').remove();

        for (i = 1; i <= numberOfBlanks; i += 1) {
          $spaces.append('<span></span>');
        }
      },
    }

    return Object.create(Game).newGame();
  }();

  // Event Handlers

  $(document).on('keypress', guessWord);

  $('p a').on('click', function (e) {
    e.preventDefault();

    startNewGame();
  });
});
