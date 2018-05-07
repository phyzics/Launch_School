// lp_08.js - Grocery List
function buyFruit(fruits) {
  var fruitList = [];
  var i;

  fruits.forEach(function (fruit) {
    for (i = 1; i <= fruit[1]; i += 1) {
      fruitList.push(fruit[0]);
    }
  });

  return fruitList;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));

// Launch School's answer
function buyFruit(fruitsList) {
  return fruitsList.map(function (fruit) {
    return repeat(fruit);
  }).reduce(function (groceryList, fruit) {
    return groceryList.concat(fruit);
  });

  function repeat(fruit) {
    var result = [];
    var i;

    for (i = 0; i < fruit[1]; i += 1) {
      result.push(fruit[0]);
    }
  }

  return result;
}
