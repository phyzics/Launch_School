# exercise_06.rb
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

  def get_age
    puts calculate_age
  end

  private

  def calculate_age
    age = (Time.new) - (Time.new(self.year))
    age = (age / 31536000).to_i
    "Your vehicle's age is #{age} years old."
  end
end

module RadioCommunication
  def call_dispatch
    puts "Calling dispatch..."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "Your car is a #{year} #{color} #{model}. Pretty spiffy, if I may say so."
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  include RadioCommunication

  def to_s
    "Your truck is a #{year} #{color} #{model}. Sweet ride, bro."
  end
end

subaru = MyCar.new(2015, 'forest green', 'Subaru Outback')
subaru.get_age
truck = MyTruck.new(2007, 'silver', 'Rodeo 18-Wheeler')
truck.get_age
