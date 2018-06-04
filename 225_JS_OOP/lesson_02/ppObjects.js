// ppObjects.js
var invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount) {
    this.unpaid.push({ name: name, amount: amount });
  },

  totalDue: function() {
    return this.unpaid.reduce(function (acc, obj) {
      return acc + obj.amount;
    }, 0);
  },

  totalPaid: function() {
    return this.paid.reduce(function (acc, obj) {
      return acc + obj.amount;
    }, 0);
  },

  payInvoice: function(name) {
    var notPaid = [];

    this.unpaid.forEach(function(invoice) {
      invoice.name === name ? invoices.paid.push(invoice) : notPaid.push(invoice);
    });

    this.unpaid = notPaid;
  },
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);
invoices.totalDue();
invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalPaid());
console.log(invoices.totalDue());
