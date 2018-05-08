// isBalanced.js
function isBalanced(string) {
  var tracker = 0;
  var chars = string.split('');
  var i;

  for (i = 0; i < chars.length; i += 1) {
    if (tracker < 0) {
      return false;
    } else if (chars[i] === '(') {
      tracker += 1;
    } else if (chars[i] === ')') {
      tracker -= 1;
    }
  }

  return tracker === 0;
}

console.log(isBalanced('What (is) this?'));
console.log(isBalanced('What is) this?'));
console.log(isBalanced('What (is this?'));
console.log(isBalanced('((What) (is this))?'));
console.log(isBalanced('((What)) (is this))?'));
console.log(isBalanced('Hey!'));
console.log(isBalanced(')Hey!('));
console.log(isBalanced('What ((is))) up('));
