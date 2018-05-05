// anagram.js
function anagram(word, list) {
  var wordSorted = word.split('').sort().join('');
  return list.filter(function (element) {
    return element.split('').sort().join('') === wordSorted;
  })
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));
