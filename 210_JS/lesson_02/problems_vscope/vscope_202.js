// vscope_202.js
function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);

/*
  guess: hello, error
  - the declaration of `a` is hoisted above it's assignment to `hello`, hence
    why the `console.log` on line 4 logs `hello`. However, this is declared at
    the level of the function, meaning when we try to log it to the console on
    line 12 we get an error since there is no `a` global variable
  - correct!
*/
