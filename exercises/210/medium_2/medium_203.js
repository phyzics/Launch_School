// medium_203.js - Tri-Angles
/* PEDAC
P:
  Right: One angle is a right angle (exactly 90 degrees).
  Acute: All three angles are less than 90 degrees.
  Obtuse: One angle is greater than 90 degrees.
  - All angles must be > 0 and sum of angles == 180
  - take three angles and return either the appropriate tri type or invalid

E:
  triangle(60, 70, 50);       // "acute"
  triangle(30, 90, 60);       // "right"
  triangle(120, 50, 10);      // "obtuse"
  triangle(0, 90, 90);        // "invalid"
  triangle(50, 50, 50);       // "invalid"
  triangle(50, 50, 90);       // "invalid"

DA:
  Data type: array of integers

  Algorithm:
    1) see if the angle is invalid
      - put all the arguments into an array
      - reduce to see the sum
        - it is invalid if != 180
    2) determine which kind of angle it is
      - are any of them 90? (use some)
      - are any of them > 90?
      - otherwise acute
*/
function isInvalidTriangle(sides) {
  var sum;

  if (sides.some(function (angle) { return angle === 0; })) return true;
  sum = sides.reduce(function (sum, angle) { return sum += angle; });

  if (sum !== 180) return true;
  return false;
}

function determineTriangleType(sides) {
  if (sides.some(function (side) { return side === 90; })) {
    return "right";
  } else if (sides.some(function (side) { return side > 90; })) {
    return "obtuse";
  } else {
    return "actue";
  }
}

function triangle(side1, side2, side3) {
  var sides = Array.prototype.slice.call(arguments);

  if (isInvalidTriangle(sides)) {
    return "invalid";
  } else {
    return determineTriangleType(sides);
  }
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
console.log(triangle(50, 50, 90));       // "invalid"
