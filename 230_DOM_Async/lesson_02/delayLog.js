function delayLog() {
  var i;

  for (i = 1; i <= 10; i += 1) {
    logNumber(i);
  }
}

function logNumber(number) {
  setTimeout(function () {
    console.log(number);
  }, number * 1000);
}

delayLog();

// Launch School's Solution
function makeLogger(number) {
  return function() {
    console.log(number);
  }
}

function delayLog() {
  var i;

  for (i = 1; i <= 10; i += 1) {
    var logger = makeLogger(i);
    setTimeout(logger, i * 1000);
  }
}
