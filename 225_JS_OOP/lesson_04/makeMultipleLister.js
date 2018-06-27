// makeMultipleLister.js
function makeMultipleLister(number) {
  return function() {
    var i;

    for (i = number; i < 100; i += number) {
      console.log(i)
    }
  }
}

var lister = makeMultipleLister(13);
lister();
