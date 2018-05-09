// string_04.js - Capitalize Words
function wordCap(string) {
  function upCase(word) {
    return word.toUpperCase();
  }

  function downCase(word) {
    return word.toLowerCase();
  }

  var caps = string.replace(/(?<=(^| ))(\w)/g, upCase);
  return caps.replace(/(?<!(^| ))(\w)/g, downCase)
}

console.log(wordCap('four score and seven'));
console.log(wordCap('the javaScript Language'));
console.log(wordCap('this is a "quoted" word'));

// Launch School's Answer
function wordCap(words) {
  return words.split(' ').map(function (word) {
    return word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase();
  }).join(' ');
}
