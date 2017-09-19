# collaborator_objects.rb
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    "jumping!"
  end
end

class Bulldog < Pet
end

class Cat < Pet
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.each { |pet| puts pet.jump }
