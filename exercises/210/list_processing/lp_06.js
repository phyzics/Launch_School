// lp_06.js - All Substrings
function substrings(string) {
  var strings = [];
  var letters = string.split('');
  var currentSelection;

  letters.forEach(function (letter1, idx1) {
    currentSelection = letters.slice(idx1);

    currentSelection.forEach(function (letter2, idx2) {
      strings.push(currentSelection.slice(0, idx2 + 1).join(''));
    });
  });

  return strings;
}

console.log(substrings('abcde'));

// Launch School's answer
function substrings(string) {
  return string.split('').map(function (char, idx) {
    return substringsAtStart(string.substring(idx));
  }).reduce(function (result, array) {
    return result.concat(array);
  });
}

function substringsAtStart(string) {
  return string.split('').map(function (char, idx, stringArray) {
    return stringArray.slice(0, idx + 1).join('');
  });
}
