// ips_02fe.js - Hollow Diamonds
function diamond(n) {
  function hollowDiamond(line) {
    return line.map(function (char, idx) {
      var last = line.length - 1;
      var first = line.indexOf('*');

      if (idx == first || idx == last) {
        return char;
      } else {
        return ' ';
      }
    });
  }

  var stars;
  var spaces;
  var row;

  for (stars = 1; stars <= n; stars += 2) {
    spaces = (n - stars) / 2;
    row = (' '.repeat(spaces) + '*'.repeat(stars)).split('');
    console.log(hollowDiamond(row).join(''));
  }

  for (stars = n - 2; stars >= 1; stars -= 2) {
    spaces = (n - stars) / 2;
    row = (' '.repeat(spaces) + '*'.repeat(stars)).split('');
    console.log(hollowDiamond(row).join(''));
  }
}

diamond(1);
diamond(3);
diamond(9);

/*PEDAC
P:
  - given n (odd int), print a diamond on an n x n grid where the insides
    are hollow
  - first line starts at 1, and by the middle there are n *
  - spaces on each side is n - (number of *) / 2

E:
  - negative? abs | undefined?
  console.log(diamond(1));
  console.log(diamond(3));
  console.log(diamond(9));

DA:
  Data Structure: Array

  Alg:
    - build the diamond based upon previous function
    - hollow the diamond
      - leave only the first and last *
        - split the row into an array
        - get the index for the first * (last is always array.length -1)
        - map over the array with idx
          - if idx !== first or last index, map ' ', o/w map '*'
          - join and log the result
*/
