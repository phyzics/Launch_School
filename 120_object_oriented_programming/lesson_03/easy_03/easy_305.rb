# easy_305.rb
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=begin
- line 13 will raise an `undefined method` error since we are trying to call
  a class method on an instance
- line 14 will execute `Television#model` on the object referenced by `tv`
- line 16 will execute `Television::manufacturer` on the `Television` class
- line 17 will raise an `undefined method` error since we are trying to call
  an instance method on a class
=end
