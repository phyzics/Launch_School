# oob_204.rb - Generic Greeting (Part 2)
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
