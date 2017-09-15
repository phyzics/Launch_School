# exercise_01.rb
class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def self.number_of_vehicles
    puts "There are #{@number_of_vehicles} on the lot."
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

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{self.color}. Noice!"
  end

  def self.calculate_gas_mileage(gallons, miles)
    puts "Your car's gas mileage is #{miles / gallons} mpg."
  end

  def to_s
    "Your vehicle is a #{year} #{color} #{model}. Pretty spiffy, if I may say so."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end
