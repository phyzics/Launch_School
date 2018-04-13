// rot13.js - Rot13 Cipher
function rot13(string) {
  var CONVERSION_OFFSET = 13;
  var newString = '';
  var i;

  for (i = 0; i < string.length; i++) {
    charCode = string.charCodeAt(i);

    if ((string[i] >= 'A' && string[i] <= 'M') || (string[i] >= 'a' && string[i] <= 'm')) {
      charCode += CONVERSION_OFFSET;
    } else if ((string[i] >= 'N' && string[i] <= 'Z') || (string[i] >= 'n' && string[i] <= 'z')) {
      charCode -= CONVERSION_OFFSET;
    }

    newString += String.fromCharCode(charCode);
  }

  return newString;
}
