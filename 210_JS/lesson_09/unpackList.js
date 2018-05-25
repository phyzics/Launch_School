/*
  get first firstDigit
    - if length < 2 = 0
    - o/w its n[0]
    - replace first element in array with n.slice(1)
  if idx 0
    - is it a range?
      - process as a range
    - punch it!
  if its last index
    - is it smaller than previous?
    - o/w punch it
  if next index is a delimiter
    - process it as a range
      - iterate over each element with index
        - skip delimiters; set first number to first, next to last
          - if last.len > first.len [5..10]
            - add to first
            - reset and add to last
          - if last < first
            - add to first
            - increment and add to last
          - else
            - add to first
            - add to last
        - push all but last into new array
      - set first to last and continue until iteration is done
  if next len > current len
    - reset
    - punch it
  if previous > current
    - increment
    - punch it
  else
    - add and punch it

*/
function unique(array) {
  uniqueArray = [];

  array.forEach(function (num) {
    if (uniqueArray.indexOf(num) === -1) uniqueArray.push(num);
  });

  return uniqueArray;
}

function unpackList(list) {
  function getFirstDigit(n) {
    var first;

    if (n.length < 2) return 0;
    if (/\d\d+/.test(n)) {
      first = n[0];
      segments[0] = n.slice(1);
    } else {
      first = 0;
    }
    return first;
  }

  function incrementFirstDigit(n) {
    firstDigit += 1;
    if (firstDigit > 9) resetFirstDigit();
  }

  function resetFirstDigit() {
    firstDigit = 1;
  }

  function processRange(range, index) {
    var first = '';
    var last = '';
    var chars = range.split(/[-:\.]/);
    var i;

    if (index !== 0) {
      if (segments[index - 1].length > 1) {
        if (Number(chars[0]) < Number(segments[index - 1][segments[index - 1].length - 1])) {
          incrementFirstDigit();
        }
      } else {
        if (Number(chars[0]) < Number(segments[index - 1])) {
          incrementFirstDigit();
        }
      }
    }

    chars.forEach(function (char, idx) {
      if (first === '') {
        first = char;
      } else if (first !== '' && last === '') {
        last = char;
      }

      if (first !== '' && last !== '') {
        if (first.length < last.length) {
          first = firstDigit + first;
          resetFirstDigit();
          last = firstDigit + last;
        } else if (Number(first) > Number(last)) {
          first = firstDigit + first;
          incrementFirstDigit();
          last = firstDigit + last;
        } else {
          first = firstDigit + first;
          last = firstDigit + last;
        }

        for (i = Number(first); i <= Number(last); i += 1) {
          unpackedList.push(i);
        }

        first = last;
        last = '';
      }
    });
  }

  var unpackedList = [];
  var segments = list.replace(/\.\./g, '.').split(',');
  var firstDigit = getFirstDigit(segments[0])
  var i;

  segments.forEach(function (segment, idx) {
    if (idx === 0) {
      if (/[-:\.]/.test(segment)) {
        processRange(segment, idx);
      } else {
        unpackedList.push(Number(String(firstDigit) + segment));
      }
    } else if (idx === segments.length - 1) {
      if (/[-:\.]/.test(segment)) {
        processRange(segment, idx);
      } else if (Number(segment) < Number(segments[idx - 1])) {
        incrementFirstDigit();
        unpackedList.push(Number(String(firstDigit) + segment));
      } else {
        unpackedList.push(Number(String(firstDigit) + segment));
      }
    } else if (/[-:\.]/.test(segment)) {
      processRange(segment, idx);
    } else if (segment.length < segments[idx + 1].length) {
      resetFirstDigit();
      unpackedList.push(Number(String(firstDigit) + segment));
    } else if (Number(segment) < Number(segments[idx - 1])) {
      incrementFirstDigit();
      unpackedList.push(Number(String(firstDigit) + segment));
    } else {
      unpackedList.push(Number(String(firstDigit) + segment));
    }
  });

  return unique(unpackedList);
}

console.log(unpackList("1,3,7,2,4,1"));
console.log(unpackList("1-3,1-2"));
console.log(unpackList("1:5:2"));
console.log(unpackList("104-2"));
console.log(unpackList("104..02"));
console.log(unpackList("545,64:11"));
