// functions_10.js
logValue();

function logValue() {
  console.log('Hello, world!');
}

/*
  guess: Hello, world!
  - this is because the function definition is hoisted above the invocation,
    and so when we invoke `logValue()` we log `Hello, world!` to the console
  - correct!
*/

// Further Exploration
var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

/*
  guess: string
  - function defintions are hoisted above variable declarations, and when we
    define a function, JS also creates a variable of the name of the function.
    Thus after the function declaration we essentially reassign `logValue` to
    `'foo'`, which is why `string` is logged to the console
  - correct!
