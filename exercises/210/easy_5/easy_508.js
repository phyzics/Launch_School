// easy_508.js - Sequence Count
function sequence(start, count) {
  var arr = [];
  var i;
  var j = count;

  for (i = 1; i <= start; i += 1) {
    arr.push(j);
    j += count;
  }

  return arr;
}

console.log(sequence(5, 1)); // [1, 2, 3, 4, 5]
console.log(sequence(4, -7)); // [-7, -14, -21, -28]
console.log(sequence(3, 0)); // [0, 0, 0]
console.log(sequence(0, 1000000));

/*
  alg:
    - i = 1 as iterator, go until > count
    - j = multiples, increments += j
*/
