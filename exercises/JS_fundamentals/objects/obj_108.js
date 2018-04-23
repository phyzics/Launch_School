// obj_108.js - The End is Near But Not Here
function penultimate(string) {
  return string.split(' ')[-2];
}

penultimate('last word');
penultimate('Launch School is great!');

/*
  The problem is that the user is assuming Arrays use negative indexing in the
  way as say Ruby does, where -2 would return the second to last index. However,
  in JS instead this looks up the -2 property for the Array object, which in
  this case will return `undefined`. Rather, the user should use one of the
  solutions below which will return the desired result
*/

function penultimate(string) {
  var words = string.split(' ');
  return words[words.length - 2];
}

// Launch School's solution
function penultimate(string) {
  return string.split(' ').slice(-2, -1)[0];
}
