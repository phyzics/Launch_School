// med_201.js - Defaults
// Version 1
function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

// Version 2
function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

// the main problem is that since there is no verification for data input,
// any truthy value will work as an argument, which includes non-number data
// This will obviously cause problems once we try and do arithmetic with non-numbers
// Further, since `0` is a falsy value, it will be ignored as an argument and the
// default value will be used instead
