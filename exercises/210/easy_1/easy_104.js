// easy_104.js - Tip Calculator
var bill = Number(prompt('What is the bill?'));
var tipPercent = Number(prompt('What is the tip percentage?'));
var tip;
var total;

tipPercent = tipPercent / 100;
tip = bill * tipPercent;
total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);
