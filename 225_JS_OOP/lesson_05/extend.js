// extend.js
function extend(destination) {
  var args = Array.prototype.slice.call(arguments, 1);

  args.forEach(function(arg) {
    Object.getOwnPropertyNames(arg).forEach(function(prop) {
      destination[prop] = arg[prop];
    });
  });

  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = { name: 'Joe' };

var funcs = {
  sayHello: function () {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);
object.sayHello();
