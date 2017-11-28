# oob_05.rb - Hello, Sophie! (Part 1)
class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
