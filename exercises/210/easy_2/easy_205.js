// easy_205.js - Right Triangles
function triangle(n) {
  var spaces;
  var stars;
  var i;
  var j;
  var k;

  for (i = n; i >= 0; i--) {
    spaces = '';
    stars = '';

    for (j = n - i; j > 0; j--) {
      stars += '*';
    }

    for (k = i; k > 0; k--) {
      spaces += ' ';
    }

    console.log(spaces + stars);
  }
}

// Launch School solution
function triangle(height) {
  var stars = 1;
  var spaces = height - 1;
  var i;

  for (i = 0; i < height; i += 1) {
    console.log(repeat(' ', spaces) + repeat('*', stars));
    stars += 1;
    spaces -= 1;
  }
}

function repeat(char, count) {
  var repeated = '';
  var i;

  for (i = 0; i < count; i += 1) {
    repeated += char;
  }

  return repeated;
}

/*
  alg:
    - use the length set by the number and interate from size to 0
      - subtract size - i
        - each time, concat size - i '*' to i ' ' and log i
*/
