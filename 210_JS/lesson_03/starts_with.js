// starts_with.js String StartsWith
function startsWith(string, searchString) {
  var match;
  var i;

  if (searchString === '') return true;

  match = true;

  for (i = 0; i < searchString.length; i ++) {
    if (string[i] !== searchString[i]) {
      match = false;
      break;
    }
  }

  return match;
}

/*
  alg:
    - return `true` if `searchString` is `''`
    - do a loop through the string, the limit being the length of the search
      - if each char === other char, by the end, return true (variable)
*/

// Launch School solution
function startsWith(string, searchString) {
  var i;
  for (i = 0; i < searchString.length; i += 1) {
    if (string[i] !== searchString[i]) {
      return false;
    }
  }

  return true;
}
