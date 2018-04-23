// repeatedCharacters.js
function repeatedCharacters(string) {
  var count = {};
  var chars = string.toLowerCase();
  var i;
  var currentChar;

  for (i = 0; i < chars.length; i++) {
    currentChar = chars[i];

    count[currentChar] ? count[currentChar]++ : count[currentChar] = 1;
  }

  for (currentChar in count) {
    if (count[currentChar] < 2) delete count[currentChar];
  }

  return count;
}

/*
  - split the string
  - iterate through the array
    - increment if it exists in the object, other wise add it
  - increment through the array and delete any properties whose value is less
    than 2
*/

// Launch School's solution
function repeatedCharacters(string) {
  var result = {};
  var lowerCaseString = string.toLowerCase();
  var i;
  var key;

  for (i = 0; i < lowerCaseString.length; i += 1) {
    if (result[lowerCaseString[i]] !== undefined) {
      result[lowerCaseString[i]] += 1;
    } else {
      result[lowerCaseString[i]] = 1;
    }
  }

  for (key in result) {
    if (result[key] === 1) {
      delete result[key];
    }
  }

  return result;
}
