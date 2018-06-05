// ppThis2.js - Practice Problems: What is this? (2)
/*
1) `this` points to `myChildObject`; a TypeError will be raised
   - 1/2: no TypeError will be raised, rather it will return `undefined` since
     there is no `count` property of `myChildObject`
*/
// 2) a) using either `call` or `apply`
  myObject.myChildObject.myMethod.call(myObject);
  myObject.myChildObject.myMethod.apply(myObject);
// b) or by binding it
  myObject.myChildObject.myMethod.bind(myObject);

/*
3) 'Peter Parker is the Amazing Spiderman!'

4) 2
   1
   1
   2
   3

5) 35000
   - to fix it, we have to make sure that `this` in `specialDiscount()` refernces
     the `computer` object. One solution is to declare a variable in `total`
     which is assigned to `this` (e.g., `var self = this`):
*/
var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    var self = this;
    function specialDiscount() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
