// easy_210.js - What Century is That
function century(year) {
  var centuryNumber;
  var lastCharacter;
  var suffix;

  centuryNumber = getCentury(year);

  switch (String(centuryNumber).slice(-1)) {
    case '1':
      suffix = 'st';
      break;
    case '2':
      suffix = 'nd';
      break;
    case '3':
      suffix = 'rd';
      break;
    default:
      suffix = 'th';
  }

  if (String(centuryNumber).slice(-2, -1) === '1') {
    suffix = 'th';
  }

  return `${centuryNumber}${suffix}`;
}

function getCentury(year) {
  var century = Math.floor(year / 100);

  if (year % 100 > 0 || century === 0) {
    century += 1;
  }

  return century;
}

// Launch School's solution
function century(year) {
  var centuryNumber = Math.floor(year / 100) + 1;

  if (year % 100 === 0) {
    centuryNumber -= 1;
  }

  return String(centuryNumber) + centurySuffix(centuryNumber);
}

function centurySuffix(centuryNumber) {
  var lastDigit;

  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}

/*
  PEDAC
  utp:
    - takes a year and returns the century
    - new centures begin with 01
  data:
    - i: number
    - o: string
    - data: number, string
  ec:
    - non integer
    - n <= 0
    - incorrect data type
  alg:
    - get the correct Century
      - Math.floor(year / 100)
        - if year % 100 > 0, add 1 to the quotient
    - get the correct ending
      - convert century to a string
      - if last char = 1, 'st', etc.
      - concatenate and return
*/
