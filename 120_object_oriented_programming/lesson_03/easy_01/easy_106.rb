# easy_106.rb
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end

=begin
- we already have access to @volume since it is initialized when
  we instantiate a new Cube object. However, if we want to 'get'
  or 'set' the value, or do anything with it, we need to use
  methods (or attr)
=end
