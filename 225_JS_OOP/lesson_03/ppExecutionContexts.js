// ppExecutionContexts.js
/*
1) 'window'

2) Object { func: [Function: func] }
   - This is because the execution context when we call `func()` on `o` is the
     object `o`, unlike the global object in #1

3) 'Hello from the global scope!'
   'Hello from the function scope!'

4) 20
   0

5) `apply` and `call`
*/

// 6)
var foo = {
  a: 1,
  b: 2,
};

var bar = {
  a: 'abc',
  b: 'def',
  add: function() {
    return this.a + this.b;
  }
};

bar.add.call(foo);
// should return 3

// 7)
var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: "A Collection of Fruit",
}

function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

outputList.apply(fruitsObj, fruitsObj.list);
/* I used apply because it takes an array as a second argument, which fruitsObj.list
   supplies

8) Because otherwise you cannot use those functions since the arguments obj
   is only 'array-like' */
