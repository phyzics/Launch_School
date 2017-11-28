# practice_05.rb
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(name)
    names = name.split
    self.last_name = names.size > 1 ? names.last : ''
    self.first_name = names.first
  end
end

bob = Person.new("Robert Smith")
puts "the person's name is: #{bob}"

=begin
  Before creating our own to_s method for the Person class, it will print out
  in string format information about the object. After the to_s is made, it
  will print out the return value of calling #name on the object 'bob'
=end
