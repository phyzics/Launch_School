function expandShortHand(shList) {
  if ((/[^-:\.0-9,]/g).test(shList) || (/:{2,}|\.{3,}|-{2,}/g).test(shList)) return null;

  var currentTens = 0;
  var longList = [];
  var numbers = shList.split(',');
  var i;

  numbers.forEach(function (n) {
    var range;

    if (/[-:]|\.\./.test(n)) {
      range = n.split(/[:-]|\.\./);

      for (i = Number(range[0]); i <= Number(range[1]); i += 1) {
        longList.push(i);
      }
    } else {
      longList.push(n);
    }
  });

  longList = longList.map(Number);

  return longList.map(function (n, idx) {
    if (idx == 0) return n;

    if (longList[idx - 1] > n) currentTens += 10;
    return currentTens + n;
  });
}

console.log(expandShortHand("1,3,7,2,4,1"));
console.log(expandShortHand("1-3,1-2"));
console.log(expandShortHand("1:3,1:2"));
console.log(expandShortHand("1..3,1..2"));
console.log();
console.log(expandShortHand("1,3,1-2"));
console.log(expandShortHand("1,3,1..2"));
console.log(expandShortHand("1,3,1:2"));
console.log();
console.log(expandShortHand("1,3/7,2,4,1"));
console.log(expandShortHand("1...3,1...2"));
console.log(expandShortHand("1--3,1--2"));
console.log(expandShortHand("1::3,1::2"));
/* PEDAC
P:
  - given a list of short hand numbers
    - once numbers go above the 9 digit, you assume the next tens place in front
  - can be separated by "-", ":", ".." <-- range, "," <-- single
  - ranges are always inclusive
  - given a string of short hand numbers, return a list of complete numbers

  Input: a String of numbers
  Output: an Array of Numbers

E:
  - incorrect delimiter
  - empty string
  - mixed single and range

  expandShortHand("1,3,7,2,4,1")
  expandShortHand("1-3,1-2")
  expandShortHand("1:3,1:2")
  expandShortHand("1..3,1..2")
  expandShortHand("1...3,1...2")
  expandShortHand("1--3,1--2")
  expandShortHand("1::3,1::2")
  expandShortHand("1,3,1-2")    // [1, 3, 11, 12]
  expandShortHand("1,3,1..2")   // [1, 3, 11, 12]
  expandShortHand("1,3,1:2")    // [1, 3, 11, 12]
  expandShortHand("")
  expandShortHand("1,3/7,2,4,1")

DA:
  Data Structure: Array of strings

  Algorithm:
  - Use a Regex to set a guard clause

  - split the string into its components (i.e., an array)
    - split on ","
  - determine if each element is a single number or a range
    - iterate over the array and use Regex.test for delimiters
    - if no delimieter
      - push Number(number) into a new array
    - if a delimiter
      - do a loop for the range, pushing each element (<=)
        - deterine first and last by a split
  - add the appropriate tens character
    - initialize a tens variable to 0
    - for each character of the array, if it is less than original array's
      previous number, add ten to the tens variable and change current
    - on each pass add the tends variable to the number in question
      - map
  - return the new array
*/
