// easy_501.js - Double Char Part 1
function repeater(string) {
  return string.replace(/(.)/g, '$1$1');
}

console.log(repeater('Hello'));
console.log(repeater('Good job!'));
console.log(repeater(''));
/*
  alg:
    - set up a string
    - for each character
      - add it twice to the return string
*/
