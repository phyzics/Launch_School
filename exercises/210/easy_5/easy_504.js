// easy_504.js - Get the Middle Character
function centerOf(string) {
  var even = !!(string.length % 2 === 0);
  var half = Math.floor(string.length / 2);

  if (even) half -= 1;

  return even ? string.slice(half, half + 2) : string.slice(half, half + 1);
}

console.log(centerOf('I Love Ruby'));
console.log(centerOf('Launch School'));
console.log(centerOf('Launch'));
console.log(centerOf('Launchschool'));
console.log(centerOf('x'));
/*
  alg:
    - use str.len / 2 to get the midpoint ( - 1 if even)
    - slice string(midpoint, 1) odd, string(mipoint, 2) if even
*/
