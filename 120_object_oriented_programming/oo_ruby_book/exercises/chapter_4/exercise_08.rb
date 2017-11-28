# exercise_08.rb
class Person
  def initialize(name)
    @name = name
  end

  def say_hi
    puts hi
  end

  private

  def hi
    "Hi, #{@name}!"
  end
end

bob = Person.new('Bob')
bob.say_hi

=begin
  The problem is that we were trying to call the private method directly,
  but it is unavailable to the object (since it is private). We can either a)
  a) make the method public, or b) use a public method to call the private
  method.
=end
