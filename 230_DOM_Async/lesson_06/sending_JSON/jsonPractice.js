document.addEventListener('DOMContentLoaded', function () {
  var request = new XMLHttpRequest();
  var data = {
    name: 'Dark Souls',
    sku: 'DS001',
    price: '5999'
  };
  var json;

  request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products');
  request.setRequestHeader('Authorization', 'token AUTH_TOKEN');
  request.setRequestHeader('Content-Type', 'application/json');

  json = JSON.stringify(data);

  request.send(json);
})
