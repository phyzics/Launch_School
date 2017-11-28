# classes_and_objs.rb
class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
  
end

bob = Person.new('bob')
puts bob.name
bob.name = 'Robert'
puts bob.name
