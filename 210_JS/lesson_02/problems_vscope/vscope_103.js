// vscope_103.js
var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

/*
  guess: empty, play station, computer
  - the first is because of the global variable, the second because of the local
    variable inside `shop3()`, the last because the global variable was changed
    by `shop2()` to `'computer'`
  - correct!
*/
