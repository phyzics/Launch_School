// Practice Problems: Constructor Functions and Prototypes (1)
/*
1) 2; 2; 2; 2; 2; 2;

2) NaN; NaN;
*/
var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  circumference: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.circumference = RECTANGLE.circumference.call(this);
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.circumference);

// 3)
function Circle(radius) {
  this.radius = radius;
  this.area = function() { return Math.PI * Math.pow(this.radius, 2); };
}

var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // 28.27
console.log(b.area().toFixed(2)); // 50.27

/*
4) `undefined` [Incorrect; answer is `true`]

5) `undefined` since we reassign the prototype to a new object that has no
   `swung` property
   [Incorrect; we get a TypeError]
*/
// 6)
var ninjaA;
var ninjaB;
function Ninja() {
 this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

Ninja.prototype.swing = function() {
  this.swung = !this.swung;
  return this;
}

console.log(ninjaA.swing().swung);
console.log(ninjaB.swing().swung);

// 7)
var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

var ninjaB = new ninjaA.constructor;

console.log(ninjaB.constructor === ninjaA.constructor);

// Other way
ninjaB = Object.create(ninjaA);
