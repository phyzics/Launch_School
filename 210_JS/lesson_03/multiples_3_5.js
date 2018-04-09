// multiples_3_5.js
function multiplesOfThreeAndFive() {
  for (var i = 1; i < 101; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i));
    }
  }
}

// Further Exploration
function multiplesOfThreeAndFive(start, finish) {
  for (var i = start; i <= finish; i++) {
    if (i % 15 === 0) {
      console.log(String(i) + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i));
    }
  }
}
