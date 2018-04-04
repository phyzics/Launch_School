// basics_05.js - Arithmetic Integer
var number1 = prompt('Enter the first number:');
var number2 = prompt('Enter the second number:');

console.log(number1 + ' + ' + number2 + ' = ' + (parseInt(number1) + parseInt(number2)));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));

// no because since `number1` and `number2` are strings, when we use the `+`
// operator it will concatenate them. In the case of the other operators,
// it will first cast the strings as integers. You can fix it by using the
// correct casting
