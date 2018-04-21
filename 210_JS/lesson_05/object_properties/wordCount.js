// wordCount.js
function wordCount(string) {
  var subStrings = string.split(' ');
  var obj = {};
  var i;

  for (i = 0; i < subStrings.length; i++) {
    if (obj[subStrings[i]]) {
      obj[subStrings[i]] += 1;
    } else {
      obj[subStrings[i]] = 1;
    }
  }

  return obj;
}

/*
  - split the string on ' '
  - iterate over the array
    - if the substr exists as a key, increment by 1
    - otherwise, add it as a property and set value to 1
*/

// Launch School's solution
function wordCount(text) {
  var count = {};
  var words = text.split(' ');
  var word;
  var i;

  for (i = 0; i < words.length; i += 1){
    word = words[i];
    if (!count[word]) {
      count[word] = 0;
    }

    count[word] += 1;
  }

  return count;
}
