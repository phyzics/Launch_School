# exercise_02.rb

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(num)
    self.speed += num
    puts "You speed the car up by #{num} mph!"
  end

  def brake(num)
    self.speed -= num
    puts "You slow the car down by #{num} mph."
  end

  def turn_off
    self.speed = 0
    puts "The car is now off."
  end

  def check_speed
    puts "You are currently going #{self.speed} mph."
  end

end

subaru = MyCar.new('2017', 'forest green', 'outback')
puts subaru.color
subaru.color = 'red'
puts subaru.color
puts subaru.year
