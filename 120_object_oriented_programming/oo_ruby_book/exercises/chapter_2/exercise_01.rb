# exercise_01.rb

class MyCar
  attr_accessor :year, :color, :model, :speed

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
subaru.speed_up(50)
subaru.check_speed
subaru.brake(20)
subaru.speed_up(30)
subaru.check_speed
subaru.brake(50)
subaru.check_speed
subaru.turn_off
