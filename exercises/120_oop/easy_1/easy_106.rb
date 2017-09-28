# easy_106.rb - Fix the Program - Flight Data
class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
