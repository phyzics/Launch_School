setTimeout(function() { // 1
  setTimeout(function() { // 6
    q(); // 12
  }, 15);

  d(); // 7

  setTimeout(function() { // 8
    n(); // 10
  }, 5);

  z(); // 9
}, 10);

setTimeout(function() { // 2
  s(); // 11
}, 20);

setTimeout(function() { // 3
  f(); // 4
});

g(); // 5

/*
  Guess: f(), g(), d(), z(), n(), s(), q()

  Answer: g(), f(), d(), z(), n(), s(), q()
*/
