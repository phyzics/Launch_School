// vscope_104.js
function hello() {
  a = 'hello';
}

hello();
console.log(a);

/*
  guess: hello
  - this is because since we don't declare `a` within `hello()` JS automatically
    declares it at the global level
  - correct!
*/
