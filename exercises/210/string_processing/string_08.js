// string_08.js - How Long Are You
function wordLengths(string) {
  if (string === '' || string === undefined) return [];

  return string.split(' ').map(function (word) {
    return word + ' ' + String(word.length);
  });
}

console.log(wordLengths('cow sheep chicken'));
console.log(wordLengths('baseball hot dogs and apple pie'));
console.log(wordLengths("It ain't easy, is it?"));
console.log(wordLengths('Supercalifragilisticexpialidocious'));
console.log(wordLengths(''));
console.log(wordLengths());
