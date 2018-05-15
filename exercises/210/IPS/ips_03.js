// ips_03.js - Now I Know My ABCs
function isBlockWord(string) {
  var blocks = [['b', 'o'], ['x, k'], ['d', 'q'], ['c', 'p'], ['n', 'a'],
                ['g', 't'], ['r', 'e'], ['f', 's'], ['j', 'w'], ['h', 'u'],
                ['v', 'i'], ['l', 'y'], ['z', 'm']];
  var letters = string.toLowerCase().split('');
  var match;
  var i;
  var j;

  for (i = 0; i < letters.length; i += 1) {
    match = false;

    for (j = 0; j < blocks.length; j += 1) {
      if (blocks[j].indexOf(letters[i]) !== -1) {
        blocks.splice(j, 1);
        match = true;
      }
    }

    if (!match) return match;
  }

  return match;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('JeSt'));       // true

console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('happy'));      // false
console.log(isBlockWord('cup'));      // false

/* PEDAC
P:
  B:O   X:K   D:Q   C:P   N:A
  G:T   R:E   F:S   J:W   H:U
  V:I   L:Y   Z:M

  - case insensitive
  - only one block per word
  - return a boolean if word can be spelt with the blocks

E:
  - invalid data type?
  - empty string?
  - string with non alphabeticals?

  isBlockWord('BATCH');      // true
  isBlockWord('BUTCH');      // false
  isBlockWord('jest');       // true
  isBlockWord('JeSt');       // false
  isBlockWord('happy');      // false

DA:
  Data Structure: array of blocks

  Alg:
    - set string to lower case
    - split string into characters (split(''))
    - iterate over string, seeing if the block is still available

    - return true at the end of iteration

*/

// LS Regex Solution
function isBlockWord(string) {
  var blocks = ['B|O', 'X|K', 'D|Q', 'C|P', 'N|A', 'G|T', 'R|E', 'F|S', 'J|W',
                'H|U', 'V|I', 'L|Y', 'Z|M'];
  var regExps = blocks.map(function (block) {
    return new RegExp(block, 'gi');
  });

  return regExps.every(function (regExp) {
    return (string.match(regExp) || []).length < 2);
  });
}
