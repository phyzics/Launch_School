// obj_104.js - Dynamic
var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]);
console.log(myObject.prop2);

/*
  logs:
  '678'
  '456'

  we first declare the variable `prop2` on line 8 and set its value to the
  string '456'. Thus on line 10, the value of `prop2` is used as a new property
  that is set to '678', hence we have inside of `myObject`

  '456': '678'

  For the second value logged, the property `prop2` of `myObject` is originally
  set to the string `'234'` on line 4, and then is reassigned on line 9 to
  `'456'`, hence why `'456'` is logged on line 13.(correct!)

  ~ FE ~
  logs:
  { funcProp = 'hello, ' }
  { funcProp = 'world!' }

  the return value of the function is what is used as the key. the function
  declaration is hoisted above the property assignment, thus the first log
  value. This property is then reassigned to `'world!'` on line 9, hence the
  second log value (correct!)
*/
