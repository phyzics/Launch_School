// easy_203.js - Stringy Strings
function stringy(number) {
  var string = '';
  var i;

  if (typeof number !== 'number') {
    return console.log('ERROR: Input must be an integer.');
  } else if (number < 1) {
    return '';
  } else if (String(number).match(/\./)) {
    console.log('CAUTION: Please only enter an integer. Forcing conversion...');
    number = parseInt(number);
  }

  for (i = 1; i <= number; i++) {
    i % 2 === 1 ? string += '1' : string += '0';
  }

  return string;
}

// Launch School solution
function stringy(size) {
  var result = '';
  var i;

  for (i = 0; i < size; i += 1) {
    if (i % 2 === 0) {
      result += '1';
    } else {
      result += '0';
    }
  }

  return result;
}

/*
  PEDAC
  utp:
    - return string with number of chars as number
      - start with 1 and alternate with 0
  data:
    - i: number
    - o: string
    - d: number, string
  ec:
    - incorrect data type
    - non-integer
    - 0 (return 0)
    - negative number (return 0)
  alg:
    - declare a variable as a string
    - loop from 1 to number, if i is odd, 1, if even, 0
*/
