// easy_302.js - Searching 101
  var num1 = prompt('Enter the 1st number:');
  var num2 = prompt('Enter the 2nd number:');
  var num3 = prompt('Enter the 3rd number:');
  var num4 = prompt('Enter the 4th number:');
  var num5 = prompt('Enter the 5th number:');
  var num6 = prompt('Enter the last number:');
  var numbers = [];

  numbers.push(Number(num1), Number(num2), Number(num3), Number(num4), Number(num5));

  if (numbers.indexOf(Number(num6)) === -1) {
    console.log('The number ' + num6 + ' does not appear in [' +
                numbers.join(', ') + '].');
  } else {
    console.log('The number ' + num6 + ' does appear in [' +
                numbers.join(', ') + '].');
  }


/*
  PEDAC
  utp:
    - get 6 numbers, check if 6th is amongst first 5
  data:
    - i/o : string
    - d: string, array
  ec:
    - incorrect data types
    - empty string
  alg:
    - use prompt() to gather the numbers
    - push first 5 into an array, using Number(x) to convert them
    - check if 6th is in it by using array.indexOf !== -1
    - return appropriate string
*/
