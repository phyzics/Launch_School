// ppObjectOrientation.js
function createProduct(id, name, stock, price) {
  return {
    id: id,
    name: name,
    stock: stock,
    price: price,
    reducePrice: function(number) {
      var newPrice = this.price - number;
      if (newPrice < 0) {
        alert("Price is invalid! [Less than 0]");
      } else {
        this.price = newPrice;
      }
    },

    describeProduct: function() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: ' + this.stock);
    },
  };
}

var scissors = createProduct(0, 'Scissors', 8, 10);
var drill = createProduct(1, 'Cordless Drill', 15, 45);
var iMac = createProduct(2, 'iMac', 30, 2500);
var keyboard = createProduct(3, 'Keyboard', 10, 25);
scissors.describeProduct();
