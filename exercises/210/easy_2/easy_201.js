// easy_201.js - Daily Double
function crunch(string) {
  var prevChar = ''
  var currentChar;
  var newString = '';
  var i;

  for (i = 0; i < string.length; i++) {
    currentChar = string[i];

    if (currentChar !== prevChar) {
      newString += currentChar;
      prevChar = currentChar;
    } else {
      continue;
    }
  }

  return newString;
}

// Launch School solution
function crunch(text) {
  var index = 0;
  var crunchText = '';

  while (index <= text.length - 1) {
    if (text[index] !== text[index + 1]) {
      crunchText += text[index];
    }

    index += 1;
  }

  return crunchText;
}

/*
  PEDAC
  utp:
    - take a string, return new string with consecutive numbers condensed to 1
  data:
    i: string
    o: string
  ec:
    - incorrect data type
  alg:
    - loop through the string
      - keep track of prev char (default is empty)
      - add current char to string if it doesn't match prev
        - change prev = current
    - return the string
*/
