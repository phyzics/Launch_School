// createObject.js
function createObject(obj) {
  function Foo() {};
  Foo.prototype = obj;

  return new Foo();
}

var foo = {
  a: 1,
};

var bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));    // true
