# easy_105.rb
class Fruit
  def initialize(name)
    name = name
  end

  def name
    @name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# Pizza does since instance variables are prepended with '@'
# we can also find out like so

p Fruit.new('apple').name #=> nil
p Pizza.new('three cheese').name  #=> "three cheese"
