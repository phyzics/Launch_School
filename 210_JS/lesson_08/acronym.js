// acronym.js
function acronym(string) {
  var words = string.split(/[ -]/g);
  return words.map(function (word) { return word[0].toUpperCase(); }).join('');
}

console.log(acronym('Portable Network Graphics'));
console.log(acronym('First In, First Out'));
console.log(acronym('PHP: HyperText Preprocessor'));
console.log(acronym('Complementary metal-oxide semiconductor'));
console.log(acronym('Hyper-text Markup Language'));
/* Alg:
  - split on /[ -]/
  - for each, map the first letter of the word upcased
  - join the returned array
*/
