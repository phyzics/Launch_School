// vscope_105.js
function hello() {
  var a = 'hello';
}

hello();
console.log(a);

/*
  guess: error
  - this is because we are trying to access a variable at the function scope
    from the global scope
  - correct!
*/
