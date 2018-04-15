// easy_202.js - Bannerizer
function logInBox(string) {
  var middleLines = '';
  var padding = '';
  var i;

  for (i = 0; i < string.length; i++) {
    middleLines += '-';
    padding += ' ';
  }

  console.log(`+-${middleLines}-+`);
  console.log(`| ${padding} |`);
  console.log(`| ${string} |`);
  console.log(`| ${padding} |`);
  console.log(`+-${middleLines}-+`);
}

// Launch School answer
function logInBox(message) {
  var horizontalRule = '+' + repeatChar('-', message.length + 2) + '+';
  var emptyLine = '|' + repeatChar(' ', message.length + 2) + '|';

  console.log(horizontalRule);
  console.log(emptyLine);
  console.log('| ' + message + ' |');
  console.log(emptyLine);
  console.log(horizontalRule);
}

function repeatChar(char, times) {
  var repeated = '';
  while (repeated.length < times) {
    repeated += char;
  }

  return repeated;
}

/*
  PEDAC
  utp:
    - take a string, and log it in the middle of a box
  data:
    - i/o: string
  ec:
    - incorrect data type
    - output will always fit in the browser window
  alg:
    - use the string length to pad the top and bottom rows
    - by default, size is +- -+/ |  |
*/
