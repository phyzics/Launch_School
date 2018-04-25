// easy_303.js - When Will I Retire
var currentAge = Number(prompt('What is your age?'));
var retirementAge = Number(prompt('At what age would you like to retire?'));
var yearsLeft = retirementAge - currentAge;

var currentYear = new Date().getUTCFullYear();
var retirementYear = currentYear + yearsLeft;

console.log("It's " + String(currentYear) + '. You will retire in ' + String(retirementYear) + '.');
console.log('You only have ' + String(yearsLeft) + ' years of work to go!');
/*
  PEDAC
  utp:
    - take in two integers, age and retirement, and display back a string with
      the current year + diff of retire and age
  data:
    - i/o: string
    - d: string, numbers
  ec:
    - incorrect data type
    - empty string
    - negative value
  alg:
    - use prompt() to get the values and store them into variables
    - get the difference of the two
    - use Date object to get current year and current year + difference
    - return the string with the appropriate values
*/
