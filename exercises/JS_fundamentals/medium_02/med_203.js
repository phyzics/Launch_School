// med_203.js - Amount Payable
var startingBalance = 1;
var chicken = 5;
var chickenQuantity = 7;

var totalPayable = function (item, quantity) {
  return startingBalance + (item * quantity);
};

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));
// Logs 40

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));
// Logs 45

// This works because functions create a closure around their surrounding
// context, i.e., keep track of the values of variables in their scope. Thus
// when we change `startingBalance` on line 14, this will reflect in the call
// to `totalPayable` on line in the log
