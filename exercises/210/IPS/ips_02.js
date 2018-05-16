// ips_02.js - Diamonds
function diamond(n) {
  var stars;
  var spaces;

  for (stars = 1; stars < n; stars += 2) {
    spaces = (n - stars) / 2;
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
  }

  console.log('*'.repeat(n));

  for (stars = n - 2; stars >= 1; stars -= 2) {
    spaces = (n - stars) / 2;
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
  }
}

diamond(1);
diamond(3);
diamond(9);

/*PEDAC
P:
  - given n (odd int), print a diamond on an n x n grid
  - first line starts at 1, and by the middle there are n *
  - spaces on each side is n - (number of *) / 2

E:
  - negative? abs | undefined?
  console.log(diamond(1));
  console.log(diamond(3));
  console.log(diamond(9));

DA:
  Data Structure: Strings

  Alg:
    - build first half of the diamond
      - loop
        - start loop at 1 (stars = 1)
        - spaces (n - stars) / 2
          - spaces.repeat(spaces num) + stars(* i)
        - stop the loop at n
        - increment by 2
    - add the middle line
      - n *
    - build the second half of the diamond
      - same as first loop, but in reverse
*/
