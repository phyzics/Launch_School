# oob_406.rb - Guaranteed Formatting
class Person
  attr_reader :name

  def name=(other_name)
    @name = other_name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
