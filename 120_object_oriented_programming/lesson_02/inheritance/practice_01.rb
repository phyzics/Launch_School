# practice_01.rb
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim
puts ''
russ = Bulldog.new
puts russ.speak
puts russ.swim
