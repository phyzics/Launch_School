// med_107.js - Invoice
function invoiceTotal() {
  args = Array.prototype.slice.call(arguments);
  return args.reduce(function (acc, val) { return acc + val });
}

// Launch School's answer
function invoiceTotal() {
  var total = 0;
  var i;

  for (i = 0; i < arguments.length; i += 1) {
    total += arguments[i];
  }

  return total;
}
