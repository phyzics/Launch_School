// begetObject.js
Object.prototype.begetObject = function() {
  function Foo() {};
  Foo.prototype = this;

  return new Foo();}

var foo = {
  a: 1,
};

var bar = foo.begetObject();
console.log(foo.isPrototypeOf(bar)); // true
