// medium_202.js - Triangle Sides
/* PEDAC
P:
  - all sides > 0
  - longest side < smaller sides summed

  Equilateral: All three sides are of equal length.
  Isosceles: Two sides are of equal length, while the third is different.
  Scalene: All three sides are of different lengths.

E:
  triangle(3, 3, 3);        // "equilateral"
  triangle(3, 3, 1.5);      // "isosceles"
  triangle(3, 4, 5);        // "scalene"
  triangle(0, 3, 3);        // "invalid"
  triangle(3, 1, 1);        // "invalid"

DA:
  Data Structure: array of numbers

  Alg:
    1) convert args into an array
    2) sort the array (a - b)
    3) if arr[0,1] summed > arr[2], then return invalid
    4) check if isosceles
      will be else
    5) check if scalene
      - a0 != a1, a0 != a2, a1 != a2
    6) check if equilateral
      - if a0 == a1 && a0 == a2 && a1 == a2
*/

function triangle(side1, side2, side3) {
  var sides = Array.prototype.slice.call(arguments);
  var type;

  sides.sort(function (a, b) { return a - b });

  if (sides[2] >= sides[0] + sides[1]) {
    type = "invalid";
  } else if (sides[0] === sides[1] && sides[1] === sides[2]) {
    type = "equilateral";
  }  else if (sides[0] !== sides[1] && sides[1] !== sides[2] && sides[0] !== sides[2]) {
    type = "scalene";
  } else {
    type = "isosceles";
  }

  return type;
}
console.log(triangle(3, 3, 3));
console.log(triangle(3, 3, 1.5));
console.log(triangle(3, 4, 5));
console.log(triangle(0, 3, 3));
console.log(triangle(3, 1, 1));
