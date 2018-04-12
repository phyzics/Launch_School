// generate_pattern.js - Pattern Generation
function generatePattern(n) {
  var numbers = '';

  for (var i = 1; i <= n; i++) {
    var spacesLeft;
    var asterisks = '';
    numbers += String(i);
    spacesLeft = n - numbers.length;

    for (var j = 1; j <= spacesLeft; j++) {
      asterisks += '*';
    }

    console.log(numbers + asterisks);
  }
}

/*
  p:
    - function takes arg `n` as rows, logs a square of numbers and *
  i/o:
    - i: number; o: string
  ec:
    - floats
  alg:
    - declare a variable outside the loop
    - in the loop
      - variable += String(i)
      - take n - variable.l and  have another loop which concatentates that many
        '*'
      - log it
*/

// Further Exploration
function generatePattern(n) {
  function getMaxLength(n) {
    var string = '';

    for (var k = 1; k <= n; k++) {
      string += String(k);
    }

    return string.length;
  }

  var numbers = '';
  var maxLength = getMaxLength(n);

  for (var i = 1; i <= n; i++) {
    var spacesLeft;
    var asterisks = '';
    numbers += String(i);
    spacesLeft = maxLength - numbers.length;

    for (var j = 1; j <= spacesLeft; j++) {
      asterisks += '*';
    }

    console.log(numbers + asterisks);
  }
}
