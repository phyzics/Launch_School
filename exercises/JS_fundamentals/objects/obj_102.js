// obj_102.js - Literal Method
var person = {
  firstName: function () {
    return 'Victor';
  },
  lastName: function () {
    return 'Reyes';
  },
};

console.log(person.firstName + ' ' + person.lastName);

/*
  It should log 'Victor Reyes' since function expressions can be the value to a
  property

  INCORRECT: the parentheses must be appended to the object literal methods
  hence it should be 'person.firstName()' and 'person.lastName()'. Instead what
  we get is a string representation of the method definition
*/
