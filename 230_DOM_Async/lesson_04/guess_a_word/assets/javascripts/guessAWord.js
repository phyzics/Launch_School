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

  function loseGame() {
    $(document).off('keypress');
    $(document.body).addClass('lose');
    $('#message + p a').text('Play another');
  }

  function winGame() {
    $(document).off('keypress');
    $(document.body).addClass('win');
    $('#message + p a').text('Play another');
  }

  function setResults(win) {
    $(document).off('keypress');
    $('#message + p a').text('Play another');

    if (win) {
      $(document.body).addClass('win');
      $('#message').text('You win!');
    } else {
      $(document.body).addClass('lose');
      $('#message').text("Sorry! You're out of guesses");
    }
  }

  function checkVictoryStatus() {
    if (game.wrongGuesses === game.maxWrongAllowed) {
      setResults(false);
    }

    if ($('#spaces span').text() === game.currentWord) {
      setResults(true);
    }
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
        this.wrongGuesses = 0;
        this.lettersGuessed = [];
        this.maxWrongAllowed = 6;
        this.currentWord = this.getWord();

        if (this.currentWord === undefined) {
          this.outOfWords();
        } else {
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

  $(document).on('keypress', function (e) {
    var keyCode = e.which;
    var key;
    var guessed = game.lettersGuessed;
    var indexes;

    if (keyCode >= 97 && keyCode <= 122) {
      key = String.fromCharCode(keyCode);

      if (!guessed.includes(key)) {
        guessed.push(key);

        if (game.currentWord.indexOf(key) !== -1) {
          indexes = getLetterIndexes(key);
          $('#spaces span').each(function (i, span) {
            if (indexes.includes(i)) {
              $(span).text(key);
            }
          });
        } else {
          $('#guesses').append('<span>' + key + '</span>');
          game.wrongGuesses += 1;
          $('#apples').removeClass().addClass('guess_' + Number(game.wrongGuesses));
        }
      }

      checkVictoryStatus();
    }
  });

  $('p a').on('click', function (e) {
    e.preventDefault();

    game.newGame();

    if (game.currentWord !== undefined) {
      $(document.body).removeClass();
      $('#apples').removeClass();
      $('p a').text('');
      $('#message').text('');
    }
  });
});
