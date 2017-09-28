# oob_06.rb - Hello, Sophie! (Part 2)
class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello, my name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
