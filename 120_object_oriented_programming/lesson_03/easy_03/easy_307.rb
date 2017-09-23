# easy_307.rb
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

=begin
- the class method `Light#information` since it makes no sense in this context.
  We want to check the brightness and color of light objects, and it doesn't
  make sense to do so on the class Light itself

- ^ incorrect (you're thinking too abstractly). The correct answer is that both
  the `return` on line 11 is superfluous; though the `attr_accessor` on line
  3 is never used, we could see how it may come into use with instances of the
  Light class
=end
