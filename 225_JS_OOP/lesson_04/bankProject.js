// bankProject.js - Project: Banking with Objects and Closures
function makeBank() {
  function makeAccount(number) {
    var balance = 0;
    var transactions = [];

    return {
      balance: function() { return balance; },

      deposit: function(amount) {
        transactions.push({ type: 'deposit', amount: amount });
        return balance += amount;
      },

      number: function() { return number; },

      transactions: function() { return transactions; },

      withdraw: function(amount) {
        if (amount > balance) amount = balance;

        transactions.push({ type: 'withdraw', amount: amount });
        balance -= amount;
        return amount;
      },
    }
  }

  var accounts = [];

  return {
    openAccount: function() {
      var number = accounts.length + 101;
      var newAccount = makeAccount(number);
      accounts.push(newAccount);
      return newAccount;
    },

    transfer: function(source, destination, amount) {
      source.withdraw(amount);
      destination.deposit(amount);
      return amount;
    }
  }
}

var bank = makeBank();
console.log(bank.accounts);
