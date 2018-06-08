// ppFF.js - Practice Problems: Create Objects with Factory Functions
/* 1)
    a) every object created with a factory function has a full copy of all the
       methods, which may be redundant
    b) there's no way for us to inspect an object and know whether it was made
       via a factory function or not, thus making it hard to identify it's "type"
*/
// 2)
function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}

// 3 - 5)
function createInvoice(services = {}) {
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    payments: [],
    total: function () {
      return this.phone + this.internet;
    },

    addPayment: function(payment) {
      this.payments.push(payment.total());
    },

    addPayments: function(arr) {
      self = this;
      arr.forEach(function(payment) {
        self.payments.push(payment.total());
      });
    },

    amountDue: function() {
      var totalPaid = this.payments.reduce(function(a, b) { return a + b; });
      totalPaid = this.total() - totalPaid;
      return totalPaid < 0 ? 0 : totalPaid;
    }
  }
}

function invoiceTotal(invoices) {
  var total = 0;
  var i;

  for (i = 0; i < invoices.length; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

function createPayment(services = {}) {
  return {
    phone: services.phone || 0,
    internet: services.internet || 0,
    amount: services.amount,
    total: function() {
      return this.amount || this.phone + this.internet;
    },
  }
}

function paymentTotal(payments) {
  var total = 0;
  var i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.amountDue());       // this should return 0
