// repeating_strings.js - Repeating Strings
function repeat(string, times) {
  var i;
  var newString = '';

  if (isNaN(times) || times <= 0) return undefined;

  for (i = 1; i <= times; i++) {
    newString += string;
  }

  return newString;
}


// Launch School solution
function repeat(string, times) {
  var repeated;
  var i;

  if (!isPositiveInteger(times)) {
    return undefined;
  }

  repeated = '';
  for(i = 0; i < times; i += 1) {
    repeated += string;
  }

  return repeated;
}

function isPositiveInteger(value) {
  return Number(value) === value && value >= 0;
}
