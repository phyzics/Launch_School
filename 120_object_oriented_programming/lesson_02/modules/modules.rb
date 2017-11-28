# modules.rb
module Swim
  def swim
    'swimming!'
  end
end

class Pet
end

class Mammals < Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Mammals
  include Swim

  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Mammals
  def speak
    "meow!"
  end
end

class Fish < Pet
  include Swim
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end
