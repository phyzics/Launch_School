// date_12.js
var today = new Date();
var nextWeek = new Date(today.getTime());
console.log(today === nextWeek);
/*
  It logs false. My guess is because `===` compares whether the operands are
  the same object, not whether or not they have the same value. (correct!)
*/
