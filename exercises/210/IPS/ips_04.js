// ips_04.js - Caesar Cipher
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

console.log(caesarEncrypt('A', 0));
console.log(caesarEncrypt('A', 3));
console.log(caesarEncrypt('y', 5));
console.log(caesarEncrypt('a', 47));
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
/* PEDAC
P:
  - cipher only works on plaintext (alphabetical), o/w returns character
  - takes a key which is the number of letters it is shifted
    - wraps around once past the end of the alphabet
  - take a string and `n` and return a ciphered string

E:
  - empty string?
  - invalid datatype?

  // simple shift
  caesarEncrypt('A', 0);       // "A"
  caesarEncrypt('A', 3);       // "D"

  // wrap around
  caesarEncrypt('y', 5);       // "d"
  caesarEncrypt('a', 47);      // "v"

  // all letters
  caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
  // "ZABCDEFGHIJKLMNOPQRSTUVWXY"
  caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
  // "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

  // many non-letters
  caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
  // "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

DA:
  Data Structure: array of strings

  Algorithm:
    - get string into an array of characters
      - split('')
    - iterate over the characters and apply the cipher
      - if non alpha, return the char (regex)
      - if alpha
        - convert to char code
        - add key
          - if it goes beyond 'z' or 'Z', then loop back to 'a'
            - use the starting char code to determine which limit to use
          - use a loop and increment 'n' times
        - convert back into char and return
    - join the returned array
*/
