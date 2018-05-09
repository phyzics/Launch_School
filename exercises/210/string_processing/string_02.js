// string_02.js Delete Vowels
function removeVowels(array) {
  return array.map(function (string) { return string.replace(/[aeiou]/gi, ''); });
}

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));
