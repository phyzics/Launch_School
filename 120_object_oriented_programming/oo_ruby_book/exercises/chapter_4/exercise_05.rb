# exercise_05.rb
class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year

  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "There are #{@number_of_vehicles} on the lot."
  end

  def speed_up(num)
    self.speed += num
    puts "You speed up by #{num} mph!"
  end

  def brake(num)
    self.speed -= num
    puts "You slow down by #{num} mph."
  end

  def turn_off
    self.speed = 0
    puts "The vehicle is now off."
  end

  def check_speed
    puts "You are currently going #{self.speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "Your ride is now #{self.color}. Noice!"
  end

  def self.calculate_gas_mileage(gallons, miles)
    puts "Your gas mileage is #{miles / gallons} mpg."
  end

  def to_s
    "Your vehicle is a #{year} #{color} #{model}. Pretty spiffy, if I may say so."
  end
end

module RadioCommunication
  def call_dispatch
    puts "Calling dispatch..."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include RadioCommunication
end

subaru = MyCar.new('2017', 'forest green', 'Subaru Outback')
p subaru.to_s
subaru.speed_up(50)
subaru.brake(20)
subaru.check_speed
MyCar.calculate_gas_mileage(5, 350)
subaru.turn_off
subaru.spray_paint('white')
subaru.to_s
puts ''

truck = MyTruck.new('2015', 'silver', '18-wheeler')
p truck.to_s
truck.speed_up(40)
truck.brake(10)
truck.check_speed
MyTruck.calculate_gas_mileage(20, 40)
truck.call_dispatch
truck.turn_off
truck.spray_paint('black')
truck.to_s
