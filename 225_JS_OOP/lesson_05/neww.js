// neww.js
function neww(constructor, args) {
  var obj = {};

  constructor.apply(obj, args);
  obj.__proto__ = constructor.prototype;
  obj.constructor = constructor;
  return obj;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
john.greeting();  // Hello, John Doe
console.log(john.constructor);  // Person(firstName, lastName) {...}

// Launch School's Solution
function neww(constructor, args) {
  var object = Object.create(constructor.prototype);
  var result = constructor.apply(object, args);

  return result === undefined ? object : result;
}
