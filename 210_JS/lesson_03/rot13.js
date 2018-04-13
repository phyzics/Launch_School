// rot13.js - Rot13 Cipher
function rot13(string) {
  var newString = '';
  var i;

  for (i = 0; i < string.length; i++) {
    newChar = rot13Character(string[i]);
    newString += newChar;
  }

  return newString;
}

function rot13Character(char) {
  var CONVERSION_OFFSET = 13;
  var charCode = char.charCodeAt(0);

  if (char.match(/[a-m]/i)) {
    charCode += CONVERSION_OFFSET;
  } else if (char.match(/[n-z]/i)) {
    charCode -= CONVERSION_OFFSET;
  }

  return String.fromCharCode(charCode);
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
