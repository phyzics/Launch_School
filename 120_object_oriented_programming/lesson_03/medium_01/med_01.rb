# med_01.rb
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Since Ben used an attr_reader method, passing in the argument :balance,
# he can use the method `balance` or `self.balance` in an instance method
# to return the value of @balance
