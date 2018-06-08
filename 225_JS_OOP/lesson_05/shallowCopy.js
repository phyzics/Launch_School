// shallowCopy.js
function shallowCopy(object) {
  var proto = Object.getPrototypeOf(object);
  var copy = Object.create(proto);
  var key;

  for (key in object) {
    copy[key] = object[key];
  }

  return copy;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() { console.log('c is ' + this.c); };

var baz = shallowCopy(bar);
console.log(baz.a);
baz.say();

// LS robust solution
function shallowCopy(object) {
  var result = Object.create(Object.getPrototypeOf(object));
  var prop;

  for (prop in object) {
    if (Object.prototype.hasOwnProperty.call(object, prop)) {
      result[prop] = object[prop];
    }
  }

  return result;
}

// LS alternative Solution
function shallowCopy(object) {
  var copy = Object.create(Object.getPrototypeOf(object));

  Object.getOwnPropertyNames(object).forEach(function(prop) {
    copy[prop] = object[prop];
  });

  return copy;
}
