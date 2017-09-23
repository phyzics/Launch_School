# easy_202.rb
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Figi", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

# returns new string "You will " concatenated with one of the strings from the
# RoadTrip.choices array
