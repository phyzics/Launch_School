# easy_301.rb
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

=begin
- 1) we instantiate a new object from the `Hello` class and save it to the
  local variable `hello` that we intialized on the same line. We then call
  the instance method `Hello#hi` on `hello`, which will pass the string
  `"Hello"` as an argument to `Greeting#greet`. `greet`'s parameter, `message`,
  is set to the string `"Hello"`. `#greet` then calls `#puts`, passing `message`
  to it as an argument. `#puts` will output "Hello" and return `nil`

- 2) "Goodbye" is printed to the terminal

- 3) an exception will be raised because no argument was specified for
  `Greeting#greet`

- 4) "Goodbye" will be printed to the terminal

- 5) an exception will be raised because we are trying to call an instance
  method on a class
=end
