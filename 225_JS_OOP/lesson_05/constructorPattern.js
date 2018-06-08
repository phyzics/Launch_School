// constructorPattern.js - Constructor Pattern
/*
1) They are capitalized

2) It will throw a TypeError since we omitted the `new` keyword, and thus
   `scamper` is a method of the `window` object [further, since there is no
   explicit return value of `Lizard`, it returns `undefined`]
*/
// 3)
function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = new Lizard();
lizzy.scamper();
