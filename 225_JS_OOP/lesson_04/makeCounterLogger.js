// makeCounterLogger.js
function makeCounterLogger(num1) {
  return function(num2) {
    var i;

    if (num2 < num1) {
      for (i = num1; i >= num2; i -= 1) {
        console.log(i);
      }
    } else {
      for (i = num1; i <= num2; i += 1) {
        console.log(i);
      }
    }
  }
}

var countlog = makeCounterLogger(5);
countlog(8);
countlog(2);
