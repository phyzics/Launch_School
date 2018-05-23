/* Algorithm
  1) convert the string into individual components
    - replace all delimiters with '-'
      - replace(//)
    - split on commas
      - split()
    - split on regex to capture digits and delimiters
      - replace(//)
  2) convert numbers into their appropriate next digit
    - keep track of previous number in a variable
    - iterate over the collection
      - if index is 0, set it to prenum and skip
      - otherwise nextNumber(currentNumber)
        - then set returned number as previous number and return it
  3) push elements into a new array
    - join the elements back together with two replace calls to join all the
      separators back together
    - then split again on ","
    3a) if it is a pure number (not a range)
      push Number(num)
    3b) if it is a range
      processRange(num)


  nextNumber(cn) {
    new Regexp object with cn /cn$/
    loop
      - return next number that:
        - is larger
        - ends with cn
    - start is Number(pn) + 1 -> ln
      - if Regexp.test(String(ln)) return String(ln)
  }

  processRange(range) {
    - split on "-"
    - first and last variable
    - iterate over the arrange
      - if !first then set ele to first
      - if first && !last, set ele to last
      - if first && last
        - loop the range and push the number IF it doesn't exist in new array
          - use indexOf
      - set last to first and first to null
  }
*/

function expandList(list) {
  function nextNumber(currentNum) {
    var ending = new RegExp(currentNum + "$");
    var i;

    for (i = Number(prevNum) + 1; ; i += 1) {
      if (ending.test(String(i))) return String(i);
    }
  }

  function processRange(range) {
    var nums = range.split("-");
    var first;
    var last;
    var i;

    nums.forEach(function (n) {
      if (!first) {
        first = n;
      } else if (first && !last) {
        last = n;
      }

      if (first && last) {
        for (i = Number(first); i <= Number(last); i += 1) {
          if (expandedList.indexOf(i) === -1) {
            expandedList.push(i);
          }
        }

        first = last;
        last = undefined;
      }
    });
  }

  var parts = list.replace(/:|\.\./g, '-').replace(/(\d+)-(\d+)/g, "$1,-,$2")
                  .replace(/(\d+)-(\d+)/g, "$1,-,$2").split(',');
  var expandedList = [];
  var prevNum;
  var newList;

  parts = parts.map(function (part, idx) {
    if (part === '-') {
      return part;
    } else if (idx === 0) {
      prevNum = part;
      return part;
    }

    prevNum = nextNumber(part);
    return prevNum;
  });

  parts = parts.join(",").replace(/(\d+),-,(\d+)/g, "$1-$2")
               .replace(/(\d+),-,(\d+)/g, "$1-$2").split(',');

  parts.forEach(function(part) {
    if (!/-/.test(part)) {
      expandedList.push(Number(part));
    } else {
      processRange(part);
    }
  });

  return expandedList;
}

console.log(expandList("1,3,7,2,4,1"));
console.log(expandList("1-3,1-2"));
console.log(expandList("1-3,2-1"));
console.log(expandList("1..3,1-2"));
console.log(expandList("1:5:2"));
console.log(expandList("104..2"));
console.log(expandList("104..02"));
console.log(expandList("545,65-11"));
