// triangle.js
function Triangle(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
}

var shape = {
  getType: function () {
    return this.type;
  },
};
var t;

Triangle.prototype = shape;
Triangle.prototype.getPerimeter = function () { return this.a + this.b + this.c; };
Triangle.prototype.constructor = Triangle;

t = new Triangle(1, 2, 3);

console.log(t.constructor);
console.log(shape.isPrototypeOf(t));
console.log(t.getPerimeter());
console.log(t.getType());
