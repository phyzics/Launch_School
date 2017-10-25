# med_109.rb
class Clock

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hr = hours
    @min = minutes
  end

  def to_s
    "#{format("%.2d", hr)}:#{format("%.2d", min)}"
  end

  def ==(other)
    hr == other.hr && min == other.min
  end

  def +(minutes)
    if min + minutes > 60
      adjust_clock_forward(minutes)
    else
      self.min += minutes
    end
    Clock.new(hr, min)
  end

  def -(minutes)
    if min - minutes < 0
      adjust_clock_backward(minutes)
    else
      self.min -= minutes
    end
    Clock.new(hr, min)
  end

  def adjust_clock_forward(minutes)
    hours, mins = (min + minutes).divmod(60)
    self.min = mins
    self.hr += hours

    self.hr -= 24 if hr >= 24
  end

  def adjust_clock_backward(minutes)
    hours, mins = (min - minutes).divmod(60)
    self.min = mins
    self.hr += hours

    self.hr += 24 if hr < 0
  end

  protected

  attr_accessor :min, :hr
end
