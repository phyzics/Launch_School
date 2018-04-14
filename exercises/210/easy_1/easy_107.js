// easy_107.js - Leap Years Part 1
function isLeapYear(year) {
  if (typeof year !== 'number') {
    return 'ERROR: Input data type must be a number'
  } else if (year < 1) {
    return 'ERROR: Year must be greater than or equal to 1';
  } else if (String(year).match(/\./)) {
    console.log('CAUTION: Input should be an integer. Forcing conversion...');
    year = Math.floor(year);
  }

  if (year % 400 === 0) {
    return true;
  } else if (year % 100 === 0) {
    return false;
  } else if (year % 4 === 0) {
    return true;
  } else {
    return false;
  }
}

// Launch School answer
// Version # 2
function isLeapYear(year) {
  return (year % 400 === 0) || (year % 4 === 0 && year % 100 !== 0);
}

/*
  PEDAC
  utp:
    - divisble by 4, unless also by 100, unless also by 400
    - take year > 0, return boolean
  data:
    - input: Number
    - output: Boolean
    - data type: Number and Boolean
  ec:
    - year <= 0 (throw an error)
    - incorrect data type
  alg:
    - if year % 400 === 0, then true
    - year % 100 === 0, then false
    - year % 4 === 0, then true
*/
