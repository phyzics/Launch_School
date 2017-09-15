# exercise_03.rb
class Person
  attr_accessor :name
  def initialize(name)
    self.name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name

# The problem was that we invoked the `attr_reader` method instead of the
# `attr_accessor` method. With the former we can only read instance data, we
# cannot manipulate it.
