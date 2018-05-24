// ips_06.js - Seeing Starts
/* PEDAC
P:
  Input: integer
  output: grid of stars (made of strings)

  - take a number
  - make a nxn grid that has stars
    - middle row is nothing but stars
    - in the other rows
      - middle index is always a star
      - beings with outermost and inner most being stars
        - each row moves these in by one

E:
  console.log(star(1));
  console.log(star(7));
  console.log(star(9));

DA:
  Data Structure: build Strings

  Algorithm:
  1) build first half
    - set endSpaces, midSpaces and mid variables
      - mid = Math.floor(n / 2);
    for..
      endSpaces = 0;
      midSpaces = mid - 1;

      spaces + * + spaces + * + spaces + * + spaces

      endSpaces++;
      midSpaecs--;

      end loop when endSpaces < mid
  2) build the middle
    - *.repeat(n)
  3) build the last half
    for ..
      endSpaces = mid;
      midSpaces = 0

      < same as above >

      endSpaces--
      midSpaces++

      end loop when midSpaces < 0
*/
function star(n) {
  function buildArrayHalf() {
    var arr = [];

    while (endSpaces < mid ) {
      line = ' '.repeat(endSpaces) + '*' + ' '.repeat(midSpaces) + '*' +
             ' '.repeat(midSpaces) + '*' + ' '.repeat(endSpaces);
      arr.push(line);

      endSpaces += 1;
      midSpaces -= 1;
    }

    return arr;
  }

  function printHalf(half) {
    half.forEach(function (line) {
      console.log(line);
    });
  }

  var mid = Math.floor(n / 2);
  var midSpaces = mid - 1;
  var endSpaces = 0;
  var starHalf = buildArrayHalf();

  printHalf(starHalf);
  console.log('*'.repeat(n));
  starHalf.reverse();
  printHalf(starHalf);
}

star(1);
star(7);
star(9);
