// split_string.js
function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: no delimiter');
    return;
  }

  var tempString = '';
  var i;

  if (delimiter === '') {
    for (i = 0; i < string.length; i++) {
      console.log(string[i]);
    }
  } else {
    for (i = 0; i < string.length; i++) {
      if (string[i] === delimiter) {
        console.log(tempString);
        tempString = '';
      } else {
        tempString += string[i];
      }
    }
  }

  if (tempString !== '') {
    console.log(tempString);
  }
}

// Launch School solution
function splitString(string, delimiter) {
  var tempString;
  var i;

  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  tempString = '';
  for (i = 0; i < string.length; i += 1) {
    if (string[i] === delimiter) {
      console.log(tempString);
      tempString = '';
    } else if (delimiter === '') {
      console.log(string[i]);
    } else {
      tempString += string[i];
    }
  }

  if (tempString) {
    console.log(tempString);
  }
}
