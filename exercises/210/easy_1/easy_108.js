// easy_108.js - Leap Years Part 2
function isLeapYear(year) {
  if (typeof year !== 'number') {
    return 'ERROR: Input data type must be a number'
  } else if (year < 1) {
    return 'ERROR: Year must be greater than or equal to 1';
  } else if (String(year).match(/\./)) {
    console.log('CAUTION: Input should be an integer. Forcing conversion...');
    year = Math.floor(year);
  }

  if (year < 1752 && year % 4 === 0) {
    return true;
  } else if (year % 400 === 0) {
    return true;
  } else if (year % 100 === 0) {
    return false;
  } else {
    return year % 4 === 0;
  }
}

/*
  PEDAC
  utp:
    - before 1752, all years / 4 are leap years
  data:
    - same as previous problem
  ec:
    - same as previous problem
  alg:
    have the first conditional be if year % 4 = 0 && year < 1752
*/
