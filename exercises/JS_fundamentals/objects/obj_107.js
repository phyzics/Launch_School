// obj_107.js - What's my Bonus
function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}

calculateBonus(2800, true);
calculateBonus(1000, false);
calculateBonus(50000, true);

/*
  This works because of the function's `arguments` object, an array-like object
  which contains all the arguments passed to the function. the arguments are
  indexed in the order in which they are passed in, so as long as we pass the
  salary as the first argument and the switch as the second, the function will
  work as intended
*/
