// ppIFFE.js
// 1) No

// 2)
(function() { console.log("Sometimes, syntax isn't intuitive!"); })();

// 3) The code is a case of where we override the value of a variable in the
//    global scope
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) { return sum += number; }, 0);
})(numbers);

console.log(sum);

// 4)
function countdown(number) {
  (function(n) {
    var i;

    for (i = n; i >= 0; i -= 1) {
      console.log(i);
    }

    console.log('Done!');
  })(number);
}

// 5) No

// 6)

function countdown(number) {
  (function count(n) {
    if (n > number) {
      return n;
    } else {
      count(n + 1);
    }

    console.log(n)
  })(0);

  console.log('Done!');
}

countdown(7);
