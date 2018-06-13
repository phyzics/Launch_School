// newPerson.js
function newPerson(name) {
  var obj = { name: name };

  Object.defineProperties(obj, {
    log: {
      value: function() { console.log(this.name); },
      writable: false,
    },
  });

  return obj;
}

var me = newPerson('Shane Riley');
me.log(); // Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log(); // Shane Riley
