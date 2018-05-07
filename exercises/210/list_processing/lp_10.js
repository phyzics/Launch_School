// lp_10.js - Inventory Item Availability
function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(function (transaction) {
    return transaction.id === inventoryItem;
  });
}

function isItemAvailable(inventoryItem, transactions) {
  var totalStock = 0;

  transactionsFor(inventoryItem, transactions).forEach(function (transaction) {
    if (transaction.movement === 'in') {
      totalStock += transaction.quantity;
    } else {
      totalStock -= transaction.quantity;
    }
  });

  return totalStock > 0;
}

var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));
console.log(isItemAvailable(105, transactions));

// Launch School's answer
function isItemAvailable(item, transactions) {
  var quantity = transactionsFor(item, transactions).reduce( function (sum, transaction) {
    if (transaction.movement === 'in') {
      return sum + transaction.quantity;
    } else {
      return sum - transaction.quantity;
    }
  }, 0);

  return quantity > 0;
}
