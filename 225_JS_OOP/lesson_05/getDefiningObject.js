// getDefiningObject.js
function getDefiningObject(object, key) {
  console.log(object);
  if (object.hasOwnProperty(key)) {
    return object;
  } else if (object !== Object.prototype) {
    return getDefiningObject(Object.getPrototypeOf(object), key);
  }

  return null;
}

var foo = {
  a: 1,
  b: 2,
}

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);
// true
console.log(getDefiningObject(qux, 'e'));
// null

// Launch School's answer
function getDefiningObject(object, propKey) {
  while (object && !object.hasOwnProperty(propKey)) {
    object = Object.getPrototypeOf(object);
  }

  return object;
}
