// lowercase.js - Converting Strings to Lower Case
function toLowerCase(string) {
  var lowerString = '';
  var asciiNumeric;
  var char;
  var i;

  for (i = 0; i < string.length; i++) {
    char = string[i];

    if (Number(char) == char) {
      lowerString += char;
      continue;
    }

    asciiNumeric = char.charCodeAt(0);

    if (asciiNumeric < 91) asciiNumeric += 32;

    char = String.fromCharCode(asciiNumeric);
    lowerString += char;
  }

  return lowerString;
}

/*
  - 1) convert char to code; add 32; convert back
    - test if char is alpha by seeing if Number(a) == a
  - 2) concatenate new char to tempString
*/

// Launch School solution
function toLowerCase(string) {
  var CONVERSION_OFFSET = 32;
  var newString = '';
  var charCode;
  var i;

  for (i = 0; i < string.length; i += 1) {
    charCode = string.charCodeAt(i);

    if (string[i] >= 'A' && string [i] <= 'Z') {
      charCode += CONVERSION_OFFSET;
    }

    newString += String.fromCharCode(charCode);
  }

  return newString;
}
