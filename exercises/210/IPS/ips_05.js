// ips_05.js - Vigenere Cipher
/* PEDAC
P:
  Input: text, keyword (strings)
  Output: string

  - a-z/i = 0-25 for a caesar shift
  - each alphanumeric is shifted by its corresponding keyword letter
    - non alphanumerics are ignored

E:
  console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "meat"));
  // Bmnxmtpeqw dhz'x gh ar pbldal!
  console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "mEaT"));
  // Bmnxmtpeqw dhz'x gh ar pbldal!
  console.log(vigenereEncrypt("Boy", "top"));
  // "Ucn"

DA:
  Data Structure: strings, building a new string

  Alg:
    1) standardize the keyword
    2) perform caesar cipher
      - loop over the string
        - have a variable keeping track of the current keyword iterator
        - push if its not an alphanumeric
        - perform caesarcipher with current letter
          - use the keyword.charCodeAt(j) - 97
          - push the result into a new string
        - increment keyword iterator
          - if its = length, set it back to 0
    3) return string
*/
function vigenereEncrypt(text, keyword) {
  var key = keyword.toLowerCase();
  var encryptedString = '';
  var j = 0;
  var i;

  for (i = 0; i < text.length; i += 1) {
    if (!/[a-z]/i.test(text[i])) {
      encryptedString += text[i];
    } else {
      encryptedString += caesarEncrypt(text[i], key.charCodeAt(j) - 97);
      j += 1;
      if (j === key.length) j = 0;
    }
  }

  return encryptedString;
}

function caesarEncrypt(string, n) {
  var letters = string.split('');
  var i;

  return letters.map(function (letter) {
    var chCode = letter.charCodeAt(0);
    var limit;

    if (/[^a-z]/i.test(letter)) return letter;

    limit = chCode > 90 ? 122 : 90;

    for (i = 0; i < n; i += 1) {
      chCode += 1;
      if (chCode > limit) chCode -= 26;
    }

    return String.fromCharCode(chCode);
  }).join('');
}

console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "meat"));
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", "mEaT"));
console.log(vigenereEncrypt("Boy", "top"));
console.log(vigenereEncrypt("Dog", "Rabbit"));
