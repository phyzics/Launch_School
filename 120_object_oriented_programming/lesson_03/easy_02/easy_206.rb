# easy_206.rb
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

=begin
- since class methods begin with `self`, we know that `#self.manufacturer`, we
  is a class method of `Television`
- we call class methods directly on the class, so either
  - Television.manufacturer
  - Television::manufacturer
=end
