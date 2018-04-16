// easy_209.js - Clean Up the Words
function cleanUp(string) {
  var cleanString = string.replace(/[^a-z ]+/gi, ' ');
  return cleanString.replace(/\s{2,}/,' ')
}

// Nick Johnson's solution
const cleanUp = str => str.replace(/[^a-z]+/gi, ' ');

// Launch School's solution
function cleanUp(text) {
  var cleanText = '';
  var i;

  for (i = 0; i < text.length; i += 1) {
    if (isLowerCaseLetter(text[i]) || isUpperCaseLetter(text[i])) {
      cleanText += text[i];
    } else if (cleanText[cleanText.length - 1] !== ' ') {
      cleanText += ' ';
    }
  }

  return cleanText;
}

function isLowerCaseLetter(char) {
  return char >= 'a' && char <= 'z';
}

function isUpperCaseLetter(char) {
  return char >= 'A' && char <= 'Z';
}

/*
  PEDAC
  utp:
    - return string with non alpha with ' '
      - only one space for runs
  data:
    - i/o: strings
  ec:
    - numbers, how are they treated?
    - empty string? assuming return an empty string
    - leading/trailing spaces?
  alg:
    - use a regex to capture the runs and replace with a white space
