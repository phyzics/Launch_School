// functions.js
function average(numbers) {
  return sum(numbers) / numbers.length;
}

function sum(numbers) {
  var total = 0;
  for (var i = 0, len = numbers.length; i < len; i += 1) {
    total += numbers[i]
  }

  return total;
}

var temperatures = [74, 43, 65, 89, 32];
console.log(average(temperatures));
